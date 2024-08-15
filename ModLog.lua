--[[ Author: Pnski ]]
--[[ What does it do?
As a Library it will read all stuff of the ModLoader if it is in the default directory, since a search might collide (again) with ubisoft
All given lines will be stored in a table
the given table will be reduced by case search to the stuff the Coder needs ]]

--[[ Usage 

local MyIdentifier = require("ModLog.lua")

local function DoSomething()
    local coolTable = MyIdentifier.ModLoader("info")
    for k,v in pairs(coolTable) do
        print(v)
    end
end
]]

local function readFile()
    DefaultPath = os.getenv("USERPROFILE")..[[\Documents\Anno 1800\log\mod-loader.log]] -- c:\User\<Username>\Documents\Anno 1800\log\mod-loader.log
    local _File = io.open(DefaultPath, "r")
    local _content = {}
    for k in _File:lines() do
        table.insert(_content,k)
    end
    _File:close()
    return _content
end

local function searchTable(_table, KeyWord)
    local trimtable = {}
    for k,v in pairs(_table) do
        if string.find(v,KeyWord) then
            table.insert(trimtable,v)
        end
    end
    return trimtable
end

function ModLoader(GivenTag)
    local _content = searchTable(readFile(),GivenTag)
    return _content
end


--[[ functional ]]
-- function readFile() DefaultPath = os.getenv("USERPROFILE")..[[\Documents\Anno 1800\log\mod-loader.log]] local _File = io.open(DefaultPath, "r") local _content = {} for k in _File:lines() do table.insert(_content,k) end _File:close() return _content end
-- function searchTable(_table, KeyWord)    local trimtable = {}    for k,v in pairs(_table) do        if string.find(v,KeyWord) then            table.insert(trimtable,v)        end    end    return trimtable end