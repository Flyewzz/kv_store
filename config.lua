local function read_whole_file(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

local config_module = {}

function config_module.get(file_name)
    local config_string = read_whole_file(file_name)
    local config = require('yaml').decode(config_string)
    return config
end

return config_module