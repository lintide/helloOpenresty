local mysql = require('resty.mysql')
--创建实例  
local db, err = mysql:new()  
if not db then  
    ngx.say("new mysql error : ", err)  
    return  
end 

--设置超时时间(毫秒)  
db:set_timeout(1000)  
  
local props = {  
    host = "127.0.0.1",  
    port = 3306,  
    database = "mj_test",  
    user = "root",  
    password = ""  
}  
  
local res, err, errno, sqlstate = db:connect(props)  
  
if not res then  
   ngx.say("connect to mysql error : ", err, " , errno : ", errno, " , sqlstate : ", sqlstate)  
   return close_db(db)  
end

--查询  
local select_sql = "select role_id, nickname from t_role_info"  
res, err, errno, sqlstate = db:query(select_sql)  
if not res then  
   ngx.say("select error : ", err, " , errno : ", errno, " , sqlstate : ", sqlstate)  
   return close_db(db)  
end  
  
  
for i, row in ipairs(res) do  
   for name, value in pairs(row) do  
     ngx.say("select row ", i, " : ", name, " = ", value, "<br/>")  
   end  
end  

