function love.conf(table)
    table.window.width = 1000
    table.window.height = 600
    table.window.resizable = false

    -- disable unused modules
    table.modules.joystick = false
    table.modules.physics = false

    table.title = "Pong Game"
end
