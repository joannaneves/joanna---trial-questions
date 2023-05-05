void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
Player* player = g_game.getPlayerByName(recipient);
if (!player) {
player = new Player(nullptr);
if (!IOLoginData::loadPlayerByName(player, recipient)) {
return;
}
}

Item* item = Item::CreateItem(itemId);
if (!item) {
    return;
}

g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

if (player->isOffline()) {
    IOLoginData::savePlayer(player);
}
delete player; -- Add this line to free up memory
}

--[[To fix the memory leak issue in the addItemToPlayer method, we need to make sure to delete the player object when it is no longer needed.
We can do this by adding a delete player; statement before the end of the function. 
This way, whether or not the player object was created in this method, we can ensure that it is properly cleaned up before the function returns.]]--