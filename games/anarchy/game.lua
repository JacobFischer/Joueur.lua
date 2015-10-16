-- Generated by Creer at 10:46PM on October 16, 2015 UTC, git hash: '98604e3773d1933864742cb78acbf6ea0b4ecd7b'
-- This is a simple class to represent the Game object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local BaseGame = require("joueur.baseGame")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class Game: Two player grid based game where each player tries to burn down the other player's buildings. Let it burn!
local Game = class(BaseGame)

--- initializes a Game with basic logic as provided by the Creer code generator
function Game:init(...)
    BaseGame.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- How many bribes players get at the beginning of their turn, not counting their burned down Buildings.
    self.baseBribesPerTurn = 0
    -- All the buildings in the game.
    self.buildings = {}
    -- The current Forecast, which will be applied at the end of the turn.
    self.currentForecast = nil
    -- The player whose turn it is currently. That player can send commands. Other players cannot.
    self.currentPlayer = nil
    -- The current turn number, starting at 0 for the first player's turn
    self.currentTurn = 0
    -- All the forecasts in the game, indexed by turn number.
    self.forecasts = {}
    -- A mapping of every game object's ID to the actual game object. Primarily used by the server and client to easily refer to the game objects via ID.
    self.gameObjects = {}
    -- The width of the entire map along the vertical (y) axis.
    self.mapHeight = 0
    -- The width of the entire map along the horizontal (x) axis.
    self.mapWidth = 0
    -- The maximum amount of fire value for any Building.
    self.maxFire = 0
    -- The maximum number of turns before the game will automatically end.
    self.maxTurns = 100
    -- The next Forecast, which will be applied at the end of your opponent's turn. This is also the Forecast WeatherStations can control this turn.
    self.nextForecast = nil
    -- List of all the players in the game.
    self.players = {}
    -- A unique identifier for the game instance that is being played.
    self.session = ""

    self.name = "Anarchy"

    self._gameObjectClasses = {
        Forecast = require("games.anarchy.forecast"),
        Player = require("games.anarchy.player"),
        FireDepartment = require("games.anarchy.fireDepartment"),
        Warehouse = require("games.anarchy.warehouse"),
        WeatherStation = require("games.anarchy.weatherStation"),
        PoliceDepartment = require("games.anarchy.policeDepartment"),
        Building = require("games.anarchy.building"),
        GameObject = require("games.anarchy.gameObject"),
    }
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Game
