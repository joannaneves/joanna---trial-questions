local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 100, player) -- Changed delay from 1000 to 100 (milliseconds)
    end
    return true
end

--[[ It's generally considered a good practice to keep the functions that you create within a limited area of your code.
That's what's meant by saying that the 'releaseStorage' function is "local".
I've made some changes to the 'onLogout' function to make it work better. It uses a function called 'addEvent' to schedule the 'releaseStorage'
function to run 100 milliseconds after the player logs out. This delay is shorter than the original 1000 milliseconds,
which should give the player enough time to log out completely before the storage value is reset.
Lastly, I've made a small change to the 'onLogout' function so that it now returns the value 'true'. --]]
