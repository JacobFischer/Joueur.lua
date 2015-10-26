-- Generated by Creer at 06:57PM on October 26, 2015 UTC, git hash: '1b69e788060071d644dd7b8745dca107577844e1'
-- This is a simple class to represent the Forecast object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local GameObject = require("games.anarchy.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class Forecast: The weather effect that will be applied at the end of a turn, which causes fires to spread.
local Forecast = class(GameObject)

--- initializes a Forecast with basic logic as provided by the Creer code generator
function Forecast:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- The Player that can use WeatherStations to control this Forecast when its the nextForecast.
    self.controllingPlayer = nil
    -- The direction the wind will blow fires in. Can be 'north', 'east', 'south', or 'west'
    self.direction = ""
    -- How much of a Building's fire that can be blown in the direction of this Forecast. Fire is duplicated (copied), not moved (transfered).
    self.intensity = 0
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Forecast
