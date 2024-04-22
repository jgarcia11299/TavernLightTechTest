--BEFORE
function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    print(guildName)
    end

--AFTER
    --This method is supposed to print names of all guilds that have less than memberCount max members
function printSmallGuildNames(memberCount)
    --Query db to grab the names from the guilds db that have less than memberCount
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    -- Store result of query
    local queryResult = db.storeQuery(string.format(selectGuildQuery, memberCount))
    --print the names of every guild in our result table.
    if not queryResult then
        print("No results found")
    else
        repeat
            local guildName = queryResult.getString("name")
            print(guildName)
        until not queryResult.next()
    end
end

--[[
Rationale:
    To begin, I changed the variable name of resultId to queryResult and made sure that guildName is grabbed from that query. 
    If queryResult is empty then we return ("No results found") to ensure we don't try to access an empty result.
    I also made sure that because the guild names are meant to be a list of names, it repeats until we reach the end of the results.
]]
