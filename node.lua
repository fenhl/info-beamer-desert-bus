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
    local size = WIDTH / 2.5
    local strength = 5
    local angle = (time % 86400) * 360 / 86400 + 90
    gl.pushMatrix()
    gl.translate(WIDTH / 2, HEIGHT / 2)
    gl.rotate(angle, 0, 0, 1)
    resource.create_colored_texture(1, 1, 1, 1):draw(0, -strength, size, strength)
    gl.popMatrix()
end

function node.render()
    hand(base_time + sys.now())
end
