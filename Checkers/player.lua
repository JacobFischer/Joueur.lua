-- Generated by Creer at 03:55PM on April 26, 2015 UTC, git hash: '2acbba9c4b682c4de68840c1ca9bec631e9c635f'
-- This is a simple class to represent the Player object in the game. You can extend it by adding utility functions here in this file.

local class = require("utilities.class")
local makeCommand = require("utilities.command")
local GameObject = require("Checkers.gameObject")

--- @class Player: A player in this game. Every AI controls one player.
local Player = class(GameObject)

--- initializes a Player with basic logic as provided by the Creer code generator
function Player:init(...)
    GameObject.init(self, ...)


    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- if the player lost the game or not
    self.lost = false
    -- What type of client this is, e.g. 'Python', 'JavaScript', or some other language. For potential data mining purposes.
    self.clientType = ""
    -- The name of the player
    self.name = "Anonymous"
    -- the reason why the player won the game
    self.reasonWon = ""
    -- The amount of time (in ms) remaining for this AI to send commands.
    self.timeRemaining = 0
    -- if the player won the game or not
    self.won = false
    -- The direction your checkers must go along the y-axis until kinged
    self.yDirection = 0
    -- the reason why the player lost the game
    self.reasonLost = ""
    -- All the checkers currently in the game owned by this player
    self.checkers = {}
end


--- Tells the server that this player is done with their turn.
function Player:endTurn()
    return makeCommand(self, "endTurn", {
    })
end

return Player
