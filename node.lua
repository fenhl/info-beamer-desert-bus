node.alias("desert-bus")

gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

local base_time = N.base_time or 0

util.data_mapper{
    ["time/set"] = function(time)
        base_time = tonumber(time) - sys.now()
        N.base_time = base_time
    end;
}

function hand(time)
    local size
    if WIDTH < HEIGHT then
        size = WIDTH / 2.5
    else
        size = HEIGHT / 2.5
    end
    local strength = 5
    local angle = (time % 86400) * 360 / 86400 + 90
    gl.pushMatrix()
    gl.translate(WIDTH / 2, HEIGHT / 2)
    gl.rotate(angle, 0, 0, 1)
    resource.create_colored_texture(1, 1, 1, 1):draw(0, -strength, size, strength)
    gl.popMatrix()
end

function node.render()
    -- Dawn Guard quadrant
    resource.create_colored_texture(0.945, 0.51, 0.129, 1):draw(0, 0, WIDTH / 2, HEIGHT / 2)
    resource.create_colored_texture(0.765, 0.42, 0.157, 1):draw(0, HEIGHT / 3, WIDTH / 2, HEIGHT / 2)
    --TODO logo
    -- Alpha Flight quadrant
    resource.create_colored_texture(0.745, 0.137, 0.161, 1):draw(WIDTH / 2, 0, WIDTH, HEIGHT / 2)
    resource.create_colored_texture(0.459, 0.067, 0.075, 1):draw(WIDTH * 0.825, 0, WIDTH * 0.925, HEIGHT / 2)
    --TODO logo
    -- Night Watch quadrant
    resource.create_colored_texture(0.035, 0.451, 0.729, 1):draw(WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT)
    --TODO logo
    -- Zeta Shift quadrant
    resource.create_colored_texture(0.376, 0.212, 0.537, 1):draw(0, HEIGHT / 2, WIDTH / 2, HEIGHT)
    resource.create_colored_texture(0.573, 0.388, 0.667, 1):draw(0, HEIGHT / 2, WIDTH / 20, HEIGHT)
    resource.create_colored_texture(0.573, 0.388, 0.667, 1):draw(WIDTH * 9 / 20, HEIGHT / 2, WIDTH / 2, HEIGHT)
    --TODO logo
    -- hand
    hand(base_time + sys.now())
end
