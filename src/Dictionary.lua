

Dictionary = {}

function Dictionary:new(tab)
    
    local dict
    if(tab ~= nil) then
        dict = tab
    else
        dict = {}
    end

    setmetatable(dict, self)
    self.__index = self

    return dict
end


function Dictionary:add(key, value)
    
    local keyValue = {key, value}
    table.insert(self, keyValue)

end

function Dictionary:display()
    io.write("{\n")
    for _, keyValue in pairs(self) do
        key = keyValue[1]
        value = keyValue[2]
        io.write("{"..key.." : "..value.."}\n")
    end
    print("}")
end

function Dictionary:get(key)
    
    for _, keyValue in pairs(self) do

        if (keyValue[1] == key) then
            return keyValue[2]
        end
    end
    return nil

end


function Dictionary:set(key, value)
    for _, keyValue in pairs(self) do

        if (keyValue[1] == key) then
            keyValue[2] = value
        end
    end
end


function Dictionary:remove(key)

    for pos, keyValue in pairs(self) do

        if (keyValue[1] == key) then
            table.remove(self, pos)
        end
    end
end


function Dictionary:reverse()
    
    local dict = deepcopy(self)
    for pos, keyValue in pairs(dict) do
        
        keyValue[1], keyValue[2] = keyValue[2], keyValue[1]
    end

    return dict
end

