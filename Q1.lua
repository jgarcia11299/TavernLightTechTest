--BEFORE
local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true 
end

--AFTER
local function releaseStorage(player)
    --sets Storage Value to -1
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    --check if player has items in storage
    if player:getStorageValue(1000) == 1 then
        --if yes, releaseStorage runs after 1 second
        addEvent(releaseStorage, 1000, player)
    end
    --finish logout
    return true
end

--[[
Rationale:
    I couldn't find any sort of coding issue or logic problems so I just added a few comments to make it clear whats going on.
]]
