function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local result = db.storeQuery(string.format(selectGuildQuery, memberCount))

    while result:next() do
        local guildName = result:getDataString("name")
        print(guildName)
    end

    result:free()
end

--[[ The `db.storeQuery` function is used to execute an SQL query and retrieve the result set.
Then, we use a `while` loop to go through each row in the result set, and we use the `result:getDataString` function to get the name of each guild.
Once we're done with the result set, we call the `result:free` function to release it from memory.
This is important to make sure that we don't end up with memory leaks in our code.
It's worth noting that the original code had some problems handling the result set that was returned by the SQL query,
and it didn't actually loop through all of the rows to get the guild names.--]]
