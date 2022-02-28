require("player")
require("enemy")
require("ball")
require("game")

function love.load()
    Player:load()
    Enemy:load()
    Ball:load()
    Game:load()
end

function love.update(delta_time)
    Player:update(delta_time)
    Enemy:update(delta_time)
    Ball:update(delta_time)
end

function love.draw()
    Player:draw()
    Enemy:draw()
    Ball:draw()
    Game:draw()
end