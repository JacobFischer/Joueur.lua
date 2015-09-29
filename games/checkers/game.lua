-- Generated by Creer at 02:44AM on September 13, 2015 UTC, git hash: '3f0e08b46657dff30d7c082da7471381f8a1ab62'
-- This is a simple class to represent the Game object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local BaseGame = require("joueur.baseGame")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class Game: The simple version of American Checkers. An 8x8 board with 12 checkers on each side that must move diagonally to the opposing side until kinged. Very simple.
local Game = class(BaseGame)

--- initializes a Game with basic logic as provided by the Creer code generator
function Game:init(...)
    BaseGame.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- The height of the board for the Y component of a checker.
    self.boardHeight = 8
    -- The width of the board for X component of a checker.
    self.boardWidth = 8
    -- The checker that last moved and must be moved because only one checker can move during each players turn.
    self.checkerMoved = nil
    -- If the last checker that moved jumped, meaning it can move again.
    self.checkerMovedJumped = false
    -- All the checkers currently in the game.
    self.checkers = {}
    -- The player whose turn it is currently. That player can send commands. Other players cannot.
    self.currentPlayer = nil
    -- The current turn number, starting at 0 for the first player's turn
    self.currentTurn = 0
    -- A mapping of every game object's ID to the actual game object. Primarily used by the server and client to easily refer to the game objects via ID.
    self.gameObjects = {}
    -- The maximum number of turns before the game will automatically end.
    self.maxTurns = 100
    -- List of all the players in the game.
    self.players = {}
    -- A unique identifier for the game instance that is being played.
    self.session = ""

    self.name = "Checkers"

    self._gameObjectClasses = {
        Checker = require("games.checkers.checker"),
        GameObject = require("games.checkers.gameObject"),
        Player = require("games.checkers.player"),
    }
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Game