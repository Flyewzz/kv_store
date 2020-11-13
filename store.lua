local Store = {}

function Store:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Store:get(key)
    if key == nil then
        io.write('All keys were been obtained')
        return self
    end
    io.write('( '..key..', '..'*value*'..') obtained')
    return self[key]
end

function Store:insert(key, value)
    io.write('( '..key..', '..value..') inserted')
    self[key] = value
end

function Store:update(key, value)
    io.write('( '..key..', '..value..') updated')
    self[key] = value
end

function Store:delete(key)
    io.write('( '..key..')'..'deleted')
    self[key] = nil
end

return Store