-- Generated by Creer at 06:57PM on October 26, 2015 UTC, git hash: '1b69e788060071d644dd7b8745dca107577844e1'
-- This is a simple class to represent the Building object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local GameObject = require("games.anarchy.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- @class Building: A basic building. It does nothing besides burn down. Other Buildings inherit from this class.
local Building = class(GameObject)

--- initializes a Building with basic logic as provided by the Creer code generator
function Building:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    -- when true this building has already been bribed this turn and cannot be bribed again this turn.
    self.bribed = false
    -- The Building directly to the east of this building, or null if not present.
    self.buildingEast = nil
    -- The Building directly to the north of this building, or null if not present.
    self.buildingNorth = nil
    -- The Building directly to the south of this building, or null if not present.
    self.buildingSouth = nil
    -- The Building directly to the west of this building, or null if not present.
    self.buildingWest = nil
    -- How much fire is currently burning the building, and thus how much damage it will take at the end of its owner's turn. 0 means no fire.
    self.fire = 0
    -- How much health this building currently has. When this reaches 0 the Building has been burned down
    self.health = 0
    -- true if this is the Headquarters of the owning player, false otherwise. Burning this down wins the game for the other Player.
    self.isHeadquarters = false
    -- The player that owns this building. If it burns down (health reaches 0) that player gets an additional bribe(s).
    self.owner = nil
    -- The location of the Building along the x-axis
    self.x = 0
    -- The location of the Building along the y-axis
    self.y = 0
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Building
