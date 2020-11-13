local config = require('config').get(arg[1])


local server = require('http.server').new(nil, config.port) -- listen *:port
local router = require('http.router').new({charset = "utf8"})
local api = require('api')

router:route({ path = '/kv/:key', method = 'GET'}, api.get_handler)
router:route({ path = '/kv', method = 'GET'}, api.get_handler)
router:route({ path = '/kv', method = 'POST'}, api.insert_handler)
router:route({ path = '/kv/:key', method = 'PUT'}, api.update_handler)
router:route({ path = '/kv/:key', method = 'DELETE'}, api.delete_handler)

server:set_router(router)


print('***** Server has started *****')
server:start()