-- returns a new table with flipped keys and values
invert = (tab) ->
  new = {}
  for k,v in pairs tab
    new[v] = k
  return new

-- returns a shallow copy of table(s)
--  will ignore non-table input
shallow_copy = (...) ->
  tabs = {...}
  new = {}
  for n = 1, select('#', ...)
    tab = select n, ...
    if "table" == type tab
      for k,v in pairs tab
        new[k] = v
  return new

{
  :invert
  :shallow_copy
}
