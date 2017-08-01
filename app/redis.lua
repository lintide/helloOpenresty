local function close_redis(red)
    if not red then
        return
    end

    local ok, err = red:close()
    if not ok then
        ngx.say("close redis error: ", err)
    end
end

local redis = require('resty.redis');

local red = redis:new()

red:set_timeout(1000)

local ok, err = red:connect('127.0.0.1', 6379)

if not ok then
    ngx.say('connect to redis error: ', err)
    return close_redis(red)
end

--调用API获取数据  
local resp, err = red:get("hello")  
if not resp then  
    ngx.say("get hello error : ", err)  
    return close_redis(red)  
end  
--得到的数据为空处理  
if resp == ngx.null then  
    resp = ''  --比如默认值  
end  
ngx.say("hello : ", resp)  
  
close_redis(red)
