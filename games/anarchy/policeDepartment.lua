-- Generated by Creer at 06:57PM on October 26, 2015 UTC, git hash: '1b69e788060071d644dd7b8745dca107577844e1'
-- This is a simple class to represent the PoliceDepartment object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local Building = require("games.anarchy.building")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class PoliceDepartment: Used to keep cities under control and raid Warehouses.
local PoliceDepartment = class(Building)

--- initializes a PoliceDepartment with basic logic as provided by the Creer code generator
function PoliceDepartment:init(...)
    Building.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

end

--- Bribe the police to raid a Warehouse, dealing damage equal based on the Warehouse's current exposure, and then resetting it to 0.
-- @param {Warehouse} warehouse: The warehouse you want to raid.
-- @returns <number> The amount of damage dealt to the warehouse, or -1 if there was an error.
function PoliceDepartment:raid(warehouse)
    return tonumber(self:_runOnServer("raid", {
        warehouse = warehouse,
    }))
end

-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return PoliceDepartment
