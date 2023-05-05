function removePlayerFromParty(playerId, playerName)
    local player = Player(playerId)
    local party = player:getParty()

    for _, member in ipairs(party:getMembers()) do
        if member:getName() == playerName then
            party:removeMember(member)
            break
        end
    end
end

--[[First, renamed the function to 'removePlayerFromParty' to make it clear that its purpose is to remove a specific player from a party.
Second, added a new parameter called 'playerName' so that we can specify which player to remove from the party.
Third, changed the loop to use 'ipairs' instead of 'pairs', since we're only interested in the values of the table (the members of the party),not the keys.
Fourth, renamed some of the variables to make them more descriptive. Specifically, we renamed 'v' to 'member'.
Fifth, used 'member:getName()'' to get the name of each member instead of creating a new 'Player' object and comparing it to 'v'.
Finally, added a 'break' statement after removing the desired player from the party. This is because we dpn't need to iterate through
the rest of the party members once we've found and removed the desired player.]]
--
