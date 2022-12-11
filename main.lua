local tick = require("../libs/tick/tick")

require("src/Const")
require("src/GameState")


function love.load()
   tick.framerate = MAX_FPS
   configWindowSize()
   love.graphics.setDefaultFilter("nearest", "nearest")
   gs = GameState:new()
end



function love.draw()
   gs:drawGameState()
   printFPS()
end


function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end

function printFPS()
   local func = function()love.graphics.print("Current FPS: "..love.timer.getFPS())end
   drawColored(255, 0, 0, func)
end