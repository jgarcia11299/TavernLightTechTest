-- BEFORE
function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()
    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(Player(membername))
        end
    end
end

-- AFTER
function removeMemberFromPlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()
    party:removeMember(Player(membername))
end

--[[
Rationale:
    Based on the information given, I was able to make out that the original method was removing a member of the player's party.
    I didn't see the point of going through the for loop and searching for a match in the player's party when once we found it we used the information passed into the method itself not found in the for loop.
    This might be to ensure that the membername exists in the party but I feel that it should be checked inside the removeMember. 
    Either that or there should be something that prints if the member name isn't in the party.
]]
