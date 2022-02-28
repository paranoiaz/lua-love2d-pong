Enemy = {}

function Enemy:load()
    self.sprite_image = love.graphics.newImage("/assets/enemy-pad.png")
    self.width = self.sprite_image:getWidth()
    self.height = self.sprite_image:getHeight()
    
    self.pos_x = love.graphics.getWidth() - self.width - 50
    self.pos_y = (love.graphics.getHeight() / 2) - (self.height / 2)
    -- slower speed than the player to make it possible to win
    self.speed_y = love.graphics.getHeight() * 0.75
    self.vel_y = 0
end

function Enemy:update(delta_time)
    self:check_collision_borders()
    self:track_ball()
    self:move(delta_time)
end

function Enemy:draw()
    love.graphics.draw(self.sprite_image, self.pos_x, self.pos_y)
end

function Enemy:check_collision_borders()
    local window_height = love.graphics.getHeight()
    if self.pos_y <= 0 then
        self.pos_y = 0
    elseif self.pos_y + self.height >= window_height then
        self.pos_y = window_height - self.height
    end
end

function Enemy:track_ball()
    -- add a margin to prioritize hitting with edges of pad
    local center_pad = self.pos_y + (self.height / 2)
    local margin_y = self.height / 4
    if center_pad - margin_y >= Ball.pos_y + Ball.height then
        self.vel_y = -self.speed_y
    elseif center_pad + margin_y <= Ball.pos_y then
        self.vel_y = self.speed_y
    else
        self.vel_y = 0
    end
end

function Enemy:move(delta_time)
    self.pos_y = self.pos_y + (self.vel_y * delta_time)
end