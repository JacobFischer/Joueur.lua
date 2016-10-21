-- Tile: A Tile in the game that makes up the 2D map grid.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local GameObject = require("games.saloon.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- A Tile in the game that makes up the 2D map grid.
-- @classmod Tile
local Tile = class(GameObject)

-- initializes a Tile with basic logic as provided by the Creer code generator
function Tile:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- The beer Bottle currently flying over this Tile.
    self.bottle = nil
    --- The Cowboy that is on this Tile, nil otherwise.
    self.cowboy = nil
    --- The furnishing that is on this Tile, nil otherwise.
    self.furnishing = nil
    --- If this Tile is pathable, but has a hazard that damages Cowboys that path through it.
    self.hasHazard = false
    --- If this Tile is a balcony of the Saloon that YoungGuns walk around on, and can never be pathed through by Cowboys.
    self.isBalcony = false
    --- The Tile to the 'East' of this one (x+1, y). nil if out of bounds of the map.
    self.tileEast = nil
    --- The Tile to the 'North' of this one (x, y-1). nil if out of bounds of the map.
    self.tileNorth = nil
    --- The Tile to the 'South' of this one (x, y+1). nil if out of bounds of the map.
    self.tileSouth = nil
    --- The Tile to the 'West' of this one (x-1, y). nil if out of bounds of the map.
    self.tileWest = nil
    --- The x (horizontal) position of this Tile.
    self.x = 0
    --- The y (vertical) position of this Tile.
    self.y = 0
    --- The YoungGun on this tile, nil otherwise.
    self.youngGun = nil

    --- (inherited) String representing the top level Class that this game object is an instance of. Used for reflection to create new instances on clients, but exposed for convenience should AIs want this data.
    -- @field[string] self.gameObjectName
    -- @see GameObject.gameObjectName

    --- (inherited) A unique id for each instance of a GameObject or a sub class. Used for client and server communication. Should never change value after being set.
    -- @field[string] self.id
    -- @see GameObject.id

    --- (inherited) Any strings logged will be stored here. Intended for debugging.
    -- @field[{string, ...}] self.logs
    -- @see GameObject.logs


end

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Tile:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.

Tile.directions = Table("North", "East", "South", "West")

-- Gets the neighbors of this Tile
--
-- @memberOf Tile
-- @instance
-- @returns {Array.<Tile>} - The neighboring (adjacent) Tiles to this tile
function Tile:getNeighbors()
    local neighbors = Table()
    for i, direction in ipairs(self.directions) do
        local neighbor = self["tile" .. direction]
        if neighbor then
            neighbors:insert(neighbor)
        end
    end
    return neighbors
end

-- Checks if a Tile is pathable to units
--
-- @memberOf Tile
-- @instance
-- @returns {boolean} - True if pathable, false otherwise
function Tile:isPathable()
    return not (self.isBalcony or self.cowboy or self.furnishing)
end

function Tile:hasNeighbor(tile)
    if tile then
        return self.tileNorth == tile or self.tileEast == tile or self.tileSouth == tile or self.tileEast == tile
    else
        return false
    end
end

-- <<-- /Creer-Merge: functions -->>

return Tile
