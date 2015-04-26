-- Generated by Creer at 03:55PM on April 26, 2015 UTC, git hash: '2acbba9c4b682c4de68840c1ca9bec631e9c635f'
-- This is a simple class to represent the Checker object in the game. You can extend it by adding utility functions here in this file.

local class = require("utilities.class")
local makeCommand = require("utilities.command")
local GameObject = require("Checkers.gameObject")

--- @class Checker: A checker on the game board.
local Checker = class(GameObject)

--- initializes a Checker with basic logic as provided by the Creer code generator
function Checker:init(...)
    GameObject.init(self, ...)


    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- The x coordinate of the checker.
    self.x = 0
    -- The y coordinate of the checker.
    self.y = 0
    -- The player that controls this Checker.
    self.owner = nil
    -- If the checker has been kinged and can move backwards.
    self.kinged = false
end


--- Moves the checker from its current location to the given (x, y).
-- @param <int> x: The x coordinate to move to.
-- @param <int> y: The y coordinate to move to.
function Checker:move(x, y)
    return makeCommand(self, "move", {
        x = x,
        y = y,
    })
end

return Checker
