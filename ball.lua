Ball = {}

function Ball:load()
    self.sprite_image = love.graphics.newImage("/assets/ball.png")
    self.width = self.sprite_image:getWidth()
    self.height = self.sprite_image:getHeight()
    
    self.pos_x = (love.graphics.getWidth() / 2) - (self.width / 2)
    self.pos_y = (love.graphics.getHeight() / 2) - (self.height / 2)
    self.speed_xy = love.graphics.getWidth() / 2
    self.vel_x = -self.speed_xy
    self.vel_y = 0
end

function Ball:update(delta_time)
    self:check_collision_borders()
    self:check_collision_pads()
    self:check_boundaries()
    self:move(delta_time)
end

function Ball:draw()
    love.graphics.draw(self.sprite_image, self.pos_x, self.pos_y)
end

function Ball:check_collision_borders()
    if self.pos_y <= 0 then
        self.vel_y = self.speed_xy
    elseif self.pos_y + self.height >= love.graphics.getHeight() then
        self.vel_y = -self.speed_xy
    end
end

function Ball:check_collision_pads()
    -- the steeper the angle from the center point the faster the ball bounces back
    if self:check_collision_object(self, Player) then
        self:bounce_ball(Player, 1)
    elseif self:check_collision_object(self, Enemy) then
        self:bounce_ball(Enemy, -1)
    end
end

function Ball:check_boundaries()
    -- dependent on which side the ball exits a point is added
    if self.pos_x <= 0 then
        self:reset_ball(1)
        Game:add_point_enemy()
    elseif self.pos_x + self.width >= love.graphics.getWidth() then
        self:reset_ball(-1)
        Game:add_point_player()
    end
end

function Ball:move(delta_time)
    self.pos_x = self.pos_x + (self.vel_x * delta_time)
    self.pos_y = self.pos_y + (self.vel_y * delta_time)
end

function Ball:check_collision_object(object_a, object_b)
    return (object_a.pos_x + object_a.width) >= object_b.pos_x and
    object_a.pos_x <= (object_b.pos_x + object_b.width) and
    (object_a.pos_y + object_a.height) >= object_b.pos_y and
    object_a.pos_y <= (object_b.pos_y + object_b.height)
end

function Ball:bounce_ball(object, modifier)
    self.vel_x = self.speed_xy * modifier
    local speed_modifier = 10
    local distance_center_points = (self.pos_y + (self.height / 2)) - (object.pos_y + (object.height / 2))
    self.vel_y = distance_center_points * speed_modifier
end

function Ball:reset_ball(modifier)
    self.pos_x = (love.graphics.getWidth() / 2) - (self.width / 2)
    self.pos_y = (love.graphics.getHeight() / 2) - (self.height / 2)
    self.vel_x = self.speed_xy * modifier
    self.vel_y = 0
end