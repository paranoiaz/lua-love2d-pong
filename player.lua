Player = {}

function Player:load()
    self.sprite_image = love.graphics.newImage("/assets/player-pad.png")
    self.width = self.sprite_image:getWidth()
    self.height = self.sprite_image:getHeight()
    
    self.pos_x = 50
    self.pos_y = (love.graphics.getHeight() / 2) - (self.height / 2)
    self.speed_y = love.graphics.getHeight()
end

function Player:update(delta_time)
    self:check_collision_borders()
    self:check_movement(delta_time)
end

function Player:draw()
    love.graphics.draw(self.sprite_image, self.pos_x, self.pos_y)
end

function Player:check_collision_borders()
    local window_height = love.graphics.getHeight()
    if self.pos_y <= 0 then
        self.pos_y = 0
    elseif self.pos_y + self.height >= window_height then
        self.pos_y = window_height - self.height
    end
end

function Player:check_movement(delta_time)
    if love.keyboard.isDown("w") then
        self.pos_y = self.pos_y - (self.speed_y * delta_time)
    elseif love.keyboard.isDown("s") then
        self.pos_y = self.pos_y + (self.speed_y * delta_time)
    end
end