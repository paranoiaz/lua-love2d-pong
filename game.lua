Game = {}

function Game:load()
    self.player = 0
    self.enemy = 0
    
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.setBackgroundColor(0.17, 0.24, 0.31, 1.0)
end

function Game:draw()
    local spacing_margin = 50
    local position_y = 20
    love.graphics.print(self.player, (love.graphics.getWidth() / 2) - spacing_margin, position_y)
    love.graphics.print(self.enemy, (love.graphics.getWidth() / 2) + spacing_margin, position_y)
end

function Game:add_point_player()
    self.player = self.player + 1
end

function Game:add_point_enemy()
    self.enemy = self.enemy + 1
end