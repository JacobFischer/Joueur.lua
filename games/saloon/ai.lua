-- This is where you build your AI for the Saloon game.

local class = require("joueur.utilities.class")
local BaseAI = require("joueur.baseAI")

--- the AI functions for the Saloon game.
-- @classmod AI
local AI = class(BaseAI)

--- The reference to the Game instance this AI is playing.
-- @field[Game] self.game
-- @see Game

--- The reference to the Player this AI controls in the Game.
-- @field[Player] self.player
-- @see Player

--- this is the name you send to the server to play as.
function AI:getName()
    return "Saloon Lua Player" -- REPLACE THIS WITH YOUR TEAM NAME!

end

--- this is called once the game starts and your AI knows its playerID and game. You can initialize your AI here.
function AI:start()
    -- replace with your start logic

end

--- this is called when the game's state updates, so if you are tracking anything you can update it here.
function AI:gameUpdated()
    -- replace with your game updated logic

end

--- this is called when the game ends, you can clean up your data and dump files here if need be
-- @tparam boolean won true means you won, won == false means you lost
-- @tparam string reason why you won or lost
function AI:ended(won, reason)
    -- replace with your ended

end


-- Game Logic Functions: functions you must fill out to send data to the game server to actually play the game! --

--- This is called every time it is this AI.player's turn.
-- @treturn bool Represents if you want to end your turn. True means end your turn, False means to keep your turn going and re-call this function.
function AI:runTurn()
    -- Put your game logic here for runTurn

    -- This is "ShellAI", some basic code we've provided that does
    -- everything in the game for demo purposed, but poorly so you
    -- can get to optimizing or overwriting it ASAP
    --
    -- ShellAI does a few things:
    -- 1. Tries to spawn a new Cowboy
    -- 2. Tries to move to a Piano
    -- 3. Tries to play a Piano
    -- 4. Tries to act
    --
    -- Note: You can find helper functions in joueur/utilities

    print("Start of my turn: " .. self.game.currentTurn)

    -- for steps 2, 3, and 4 we will use this cowboy:
    local cowboy = nil
    for i, myCowboy in ipairs(self.player.cowboys) do
        if not myCowboy.isDead then
            cowboy = myCowboy
            break
        end
    end



    ----- 1. Try to spawn a Cowboy -----

    local callInJob = self.game.jobs:randomElement() -- grab a random job to try to call in
    local jobCount = 0
    for i, myCowboy in ipairs(self.player.cowboys) do
        if not myCowboy.isDead and myCowboy.job == callInJob then
            jobCount = jobCount + 1
        end
    end

    -- check to make sure we can call in this job
    if self.player.youngGun.canCallIn and jobCount < self.game.maxCowboysPerJob then
        print("1. Calling in: " .. callInJob);
        self.player.youngGun:callIn(callInJob);
    end

    -- make sure we found a cowboy to try to do things with
    if cowboy then
        ----- 2. Try to move to a Piano -----
        local piano = nil -- find a piano
        for i, furnishing in ipairs(self.game.furnishings) do
            if furnishing.isPiano and not furnishing.isDestroyed then
                piano = furnishing
                break
            end
        end

        -- if the cowboy can move and is not dead and there is a piano to move to
        if cowboy.canMove and not cowboy.isDead then
            print("Trying to do stuff with Cowboy #" .. cowboy.id)

            -- find a path from the Tile this cowboy is on to the tile the piano is on
            local path = self:findPath(cowboy.tile, piano.tile)

            -- if there is a path, move to it
            --      length 0 means no path could be found to the tile
            --      length 1 means the piano is adjacent, and we can't move onto the same tile as the piano
            if #path > 1 then
                print("2. Moving to Tile #" .. path[1].id)
                cowboy:move(path[1])
            end
        end



        ----- 3. Try to play a piano -----

        -- make sure the cowboy is alive and is not busy
        if not cowboy.isDead and cowboy.turnsBusy == 0 then
            -- look at all the neighboring (adjacent) tiles, and if they have a piano, play it
            for i, neighbor in ipairs(cowboy.tile:getNeighbors()) do
                -- if the neighboring tile has a piano
                if neighbor.furnishing and neighbor.furnishing.isPiano then
                    -- then play it
                    print("3. Playing Furnishing (piano) #" .. neighbor.furnishing.id);
                    cowboy:play(neighbor.furnishing)
                    break
                end
            end
        end



        ----- 4. Try to act -----

        -- make sure the cowboy is alive and is not busy
        if not cowboy.isDead and cowboy.turnsBusy == 0 then
            -- The Cowboy.act() function works differently based on job, and requires a neighboring tile to act on
            local randomNeighbor = cowboy.tile:getNeighbors():randomElement()

            if cowboy.job == "Bartender" then
                    -- Bartenders throw Bottles in a direction, and the Bottle makes cowboys drunk which causes them to walk in random directions
                    -- so throw the bottle on a random neighboring tile, and make drunks move in a random direction
                    local direction = cowboy.tile.directions:randomElement()
                    print("4. Bartender acting on Tile #" .. randomNeighbor.id .. " in direction " .. direction)
                    cowboy:act(randomNeighbor, direction)
            elseif cowboy.job == "Brawler" then
                    -- Brawlers cannot act, they instead automatically attack all neighboring tiles on the end of their owner's turn.
                    print("4. Brawlers cannot act.")
            elseif "Sharpshooter" then
                    -- Sharpshooters build focus by standing still, they can then act(tile) on a neighboring tile to fire in that direction
                    if cowboy.focus > 0 then
                        print("4. Sharpshooter acting on Tile #" .. randomNeighbor.id)
                        cowboy:act(randomNeighbor) -- fire in a random direction
                    end
            end
        end
    end

    print("Ending my turn.");

    -- we are done, returning true tells the game server we are indeed done with our turn.
    return true;
end

--- A very basic path finding algorithm (Breadth First Search) that when given a starting Tile, will return a valid path to the goal Tile.
-- @tparam Tile start the starting Tile
-- @tparam Tile goal the goal Tile
-- @treturns Table(Tile) An array of Tiles representing the path, the the first element being a valid adjacent Tile to the start, and the last element being the goal.
function AI:findPath(start, goal)
    local queue = Table(start)
    local parents = Table()
    local queued = Table()

    while #queue > 0 do
        -- pop the first tile off the front of the queue
        local tile = queue:popFront()

        -- look at all this tile's neighbors
        for i, neighbor in ipairs(tile:getNeighbors()) do
            if neighbor == goal then -- we found the path!
                -- let's reconstruct the path to this end goal, starting and the end and retracing our steps back to the start
                local path = Table(goal)

                -- go backward to build the path till we find the starting tile
                while tile ~= start do
                    -- push the tile in the path on the front (so the end of the path is the end of the array)
                    path:pushFront(tile)
                    -- and set the next tile to look at
                    tile = parents[tile.id]
                end

                return path
            end

            -- check if the neighbor we are looking at needs to be queued
            if not queued[neighbor.id] and neighbor:isPathable() then
                -- queue it, and record that it's been queued so we don't investigate it multiple times
                queue:insert(neighbor)
                queued[neighbor.id] = true

                -- record how we got to this tile, for path reconstruction
                parents[neighbor.id] = tile
            end
        end
    end

    return Table()
end



return AI
