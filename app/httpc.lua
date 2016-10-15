-- ngx.say("httpc")

local http = require "resty.http"
local httpc = http.new()
local res, err = httpc:request_uri("http://httpbin.org/get", {
  method = "GET"
})

if not res then
  ngx.say("failed to request: ", err)
  return
end

ngx.say(res.body)
