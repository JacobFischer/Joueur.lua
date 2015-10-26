-- Generated by Creer at 06:57PM on October 26, 2015 UTC, git hash: '1b69e788060071d644dd7b8745dca107577844e1'
-- This is where you build your AI for the Anarchy game.

local class = require("joueur.utilities.class")
local BaseAI = require("joueur.baseAI")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class AI: the AI functions for the Anarchy game.
local AI = class(BaseAI)

-- this is the name you send to the server to play as.
function AI:getName()
    -- <<-- Creer-Merge: get-name -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    return "Anarchy Lua Player" -- REPLACE THIS WITH YOUR TEAM NAME!
    -- <<-- /Creer-Merge: get-name -->>
end

-- this is called once the game starts and your AI knows its playerID and game. You can initialize your AI here.
function AI:start()
    -- <<-- Creer-Merge: start -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your start logic
    -- <<-- /Creer-Merge: start -->>
end

-- this is called when the game's state updates, so if you are tracking anything you can update it here.
function AI:gameUpdated()
    -- <<-- Creer-Merge: game-updated -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your game updated logic
    -- <<-- /Creer-Merge: game-updated -->>
end

--- this is called when the game ends, you can clean up your data and dump files here if need be
-- @param {boolean} won == true means you won, won == false means you lost
-- @param {string} reason you won or lost
function AI:ended(won, reason)
    -- <<-- Creer-Merge: ended -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your ended
    -- <<-- /Creer-Merge: ended -->>
end

--- Game Logic Functions: functions you must fill out to send data to the game server to actually play the game! ---

--- This is called every time the AI is asked to respond with a command during their turn
-- @returns {boolean} represents if you want to end your turn. true means end the turn, false means to keep your turn going and re-call runTurn()
function AI:runTurn()
    -- <<-- Creer-Merge: runTurn -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- Put your game logic here for runTurn
    return true
    -- <<-- /Creer-Merge: runTurn -->>
end

-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you need additional functions for your AI you can add them here
-- <<-- /Creer-Merge: functions -->>

return AI
