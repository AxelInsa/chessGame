WIDTH = nil
HEIGHT = nil
DIM = 8
SQSIZE = nil
MAX_FPS = 15
IMAGES = {
    wp = love.graphics.newImage("resources/wp.png"),
    wR = love.graphics.newImage("resources/wR.png"),
    wN = love.graphics.newImage("resources/wN.png"),
    wB = love.graphics.newImage("resources/wB.png"),
    wQ = love.graphics.newImage("resources/wQ.png"),
    wK = love.graphics.newImage("resources/wK.png"),
    bp = love.graphics.newImage("resources/bp.png"),
    bR = love.graphics.newImage("resources/bR.png"),
    bN = love.graphics.newImage("resources/bN.png"),
    bB = love.graphics.newImage("resources/bB.png"),
    bQ = love.graphics.newImage("resources/bQ.png"),
    bK = love.graphics.newImage("resources/bK.png")
}
DIR = io.popen("cd"):read()

function configWindowSize()
    love.window.setMode(0, 0)
    WIDTH, HEIGHT = getWidthHeight()
    MINWH = math.min(WIDTH, HEIGHT) * 0.8
    love.window.setMode(MINWH, MINWH)
    SQSIZE = MINWH / 8    
end


function getWidthHeight()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    return width, height
end
