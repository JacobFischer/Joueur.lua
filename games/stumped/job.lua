-- Job: Information about a beaver's job.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local GameObject = require("games.stumped.gameObject")



--- Information about a beaver's job.
-- @classmod Job
local Job = class(GameObject)

-- initializes a Job with basic logic as provided by the Creer code generator
function Job:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- The number of actions this Job can make per turn.
    self.actions = 0
    --- How many combined resources a beaver with this Job can hold at once.
    self.carryLimit = 0
    --- Scalar for how many branches this Job harvests at once.
    self.chopping = 0
    --- How much food this Job costs to recruit.
    self.cost = 0
    --- The amount of damage this Job does per attack.
    self.damage = 0
    --- How many turns a beaver attacked by this Job is distracted by.
    self.distractionPower = 0
    --- The amount of starting health this Job has.
    self.health = 0
    --- The number of moves this Job can make per turn.
    self.moves = 0
    --- Scalar for how much food this Job harvests at once.
    self.munching = 0
    --- The Job title.
    self.title = ""

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

--- Recruits a Beaver of this Job to a lodge
-- @tparam Tile tile The Tile that is a lodge owned by you that you wish to spawn the Beaver of this Job on.
-- @treturn Beaver The recruited Beaver if successful, nil otherwise.
function Job:recruit(tile)
    return (self:_runOnServer("recruit", {
        tile = tile,
    }))
end

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Job:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.





return Job
