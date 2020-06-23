config = require "lapis.config"

config "production", ->
  session_name "guard13007com"
  secret os.getenv("SESSION_SECRET") or "totally a secret"
  postgres ->
    host os.getenv("DB_HOST") or "guard13007comdb"
    user os.getenv("DB_USER") or "postgres"
    database os.getenv("DB_NAME") or "postgres"
    password os.getenv("DB_PASS") or "" -- blank password may not function as no password?
  port 80
  num_workers 4
  code_cache "on"
