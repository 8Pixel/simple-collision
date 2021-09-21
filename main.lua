MAP = {
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
    { 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, },
    { 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, },
    { 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, },
    { 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, },
    { 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, },
    { 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, },
    { 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, },
    { 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, },
}

DIMENSION = 64

Entity = { x = 64, y = 64, velocity = 64 }

function GetTile(x, y)
    return math.floor(y / DIMENSION) + 1, math.floor(x / DIMENSION) + 1
end

function love.keypressed(key, scancode, isrepeat)
    local velocity = 64
    local x = 0
    local y = 0
    if key == 'left' then
        x = -velocity
    elseif key == 'right' then
        x = velocity
    elseif key == 'up' then
        y = -velocity
    elseif key == 'down' then
        y = velocity
    end
    local i, j = GetTile(Entity.x + x, Entity.y + y)

    if MAP[i][j] ~= 1 then
        Entity.x = Entity.x + x
        Entity.y = Entity.y + y
    end
end

function love.draw()
    for i = 1, #MAP, 1 do
        for j = 1, #MAP[i], 1 do
            if MAP[i][j] == 1 then
                love.graphics.setColor(255, 255, 255)
                love.graphics.rectangle('fill', (j - 1) * DIMENSION, (i - 1) * DIMENSION, DIMENSION, DIMENSION)
            end
        end
    end
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle('fill', Entity.x, Entity.y, DIMENSION, DIMENSION)
end