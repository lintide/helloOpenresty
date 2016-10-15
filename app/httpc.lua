-- ngx.say("httpc")

local http = require "resty.http"
local httpc = http.new()
local res, err = httpc:request_uri("https://github.com/", {
  method = "GET",
  ssl_verify = false,
})

if not res then
  ngx.say("failed to request: ", err)
  return
end

ngx.say(res.body)
