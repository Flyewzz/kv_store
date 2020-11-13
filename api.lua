#!/usr/bin/env tarantool

Store = require('store')

local store = Store:new()
local api = {}

function api.get_handler(req)
    local values = store:get(req:stash('key'))
    local resp = req:render{
        json = values,
    }
    return resp
end

function api.insert_handler(req)
    local key = req:post_param('key')
    local value = req:post_param('value')
    store:insert(key, value)
    local resp = req:render{
        text = 'inserted',
    }
    return resp
end

function api.update_handler(req)
    local key = req:stash('key')
    local value = req:post_param('value')
    store:update(key, value)
    local resp = req:render{
        text = 'updated',
    }
    return resp
end

function api.delete_handler(req)
    local key = req:stash('key')
    store:delete(key)
    local resp = req:render{
        text = 'removed',
    }
    return resp
end

return api