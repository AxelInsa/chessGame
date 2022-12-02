
-- Returns the length of a table
function len(table)
    local size = 0
    for i, elem in pairs(table) do
       size = size + 1
    end
 
    return size
 end


 -- Print the FPS in the top left corner
 function printFPS()
    local func = function()love.graphics.print("Current FPS: "..love.timer.getFPS())end
    drawColored(255, 0, 0, func)
 end


 -- a function to colored thing. Pass the rgb values and the function that draws an objects
function drawColored(red, green, blue, func)
    love.graphics.setColor(love.math.colorFromBytes(red, green, blue))
    func()
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
end

