lapis = require "lapis"
config = require("lapis.config").get!

import respond_to, json_params from require "lapis.application"
import hmac_sha1 from require "lapis.util.encoding"
import insert from table

const_compare = (string1, string2) ->
  local fail, dummy

  for i = 1, 100
    if string1\sub(i,i) ~= string2\sub(i,i)
      fail = true
    else
      dummy = true -- attempting to make execution time equal

  return not fail

hex_dump = (str) ->
  len = string.len str
  hex = ""

  for i = 1, len
    hex ..= string.format( "%02x", string.byte( str, i ) )

  return hex

execute = (cmd, capture_exit_code=true) ->
  local handle
  if capture_exit_code
    handle = io.popen "#{cmd}\necho $?"
  else
    handle = io.popen cmd
  result = handle\read "*a"
  handle\close!
  return result

run_update = (branch) ->
  log = {}
  insert log, execute "git checkout #{branch} 2> /dev/stdout"
  insert log, execute "git pull origin 2> /dev/stdout"
  insert log, execute "git submodule init 2> /dev/stdout"
  insert log, execute "git submodule update 2> /dev/stdout"
  -- captures its own exit code at the end
  insert log, execute "code=0\nfor file in $(find . -type f -name \"*.moon\"); do moonc \"$file\" 2> /dev/stdout\ntmp=$?\nif [ ! $tmp -eq 0 ]; then code=$tmp\nfi; done\necho $code", false
  insert log, execute "lapis migrate #{config._name} 2> /dev/stdout"
  insert log, execute "lapis build #{config._name} 2> /dev/stdout"

  exit_codes = {}
  failure = false
  full_log = ""
  for result in *log
    exit_start, exit_end = result\find "(%d*)[%c]$"
    exit_code = tonumber result\sub(exit_start, exit_end)\sub 1, -2

    output = result\sub 1, exit_start - 1
    full_log ..= output

    -- this sequence should not be needed, I am leaving it temporarily
    if exit_code == nil -- this happens for the moonc calls
      if output\find "Failed to parse" -- so we search for an error
        exit_code = 1
      else
        exit_code = 0 -- and I don't think there are other types of errors...
        insert exit_codes, 9001 -- means a NIL exit code happened somehow

    failure = true if exit_code != 0
    insert exit_codes, exit_code

  if failure
    return status: 500, json: {
      status: "failure"
      message: "a subprocess returned a non-zero exit code"
      log: full_log
      :exit_codes
    }
  else
    return status: 200, json: {
      status: "success"
      message: "server updated to latest version of '#{branch}'"
      log: full_log
      :exit_codes
    }

ignored = ->
  return status: 200, json: {
    status: "success"
    message: "ignored push (looking for updates to '#{branch}')"
  }

class extends lapis.Application
  [githook: "/githook"]: respond_to {
    GET: =>
      return status: 405, "Method Not Allowed"

    POST: json_params =>
      branch = config.githook_branch or "master"
      if config.githook_secret
        ngx.req.read_body!
        if body = ngx.req.get_body_data!
          authorized = const_compare "sha1=#{hex_dump hmac_sha1 config.githook_secret, body}", @req.headers["X-Hub-Signature"]
          unless authorized
            return status: 401, "Unauthorized"
          if @params.ref == "refs/heads/#{branch}"
            return run_update branch
          elseif @params.ref == nil
            return status: 400, json: {
              status: "invalid request"
              message: "'ref' not defined in request body"
            }
          else
            return ignored branch
        else
          return status: 400, json: {
            status: "invalid request"
            message: "no request body"
          }
      else
        if @params.ref == "refs/heads/#{branch}"
          return run_update branch
        else
          return ignored branch
    }