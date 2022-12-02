local tick = require("../libs/tick/tick")

require("src.Utils")
require("src.Const")
require("src.GameState")
require("src.Move")
require("src.Dictionary")
require("src.ClickHandler")


sqSelected = {}
playerClicks = {}

function love.load()
   tick.framerate = MAX_FPS
   configWindowSize()
   love.graphics.setDefaultFilter("nearest", "nearest")
   gs = GameState:new()
   clickHandler = ClickHandler:new()
end



function love.draw()
   gs:drawGameState()
   printFPS()
end


function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   elseif key == "left" then
         gs:undoMove()
   end

end

function love.mousepressed(x, y, button, istouched)
   if button == 1 then
      clickHandler:updateClicks(x, y)   
      if(clickHandler:isTimeToMove()) then

         move = Move:new(clickHandler.playerClicks[1], clickHandler.playerClicks[2], gs.board)
         gs:makeMove(move)
         clickHandler:resetClicks()

      end
   end   
end

