

GameState = {}

function GameState:new()
    local gs = {}
    setmetatable(gs, self)
    self.__index = self

    gs.board = {
        {"bR", "bN", "bB", "bQ", "bK", "bB", "bN", "bR"},
        {"bp", "bp", "bp", "bp", "bp", "bp", "bp", "bp"},
        {"--", "--", "--", "--", "--", "--", "--", "--"},
        {"--", "--", "--", "--", "--", "--", "--", "--"},
        {"--", "--", "--", "--", "--", "--", "--", "--"},
        {"--", "--", "--", "--", "--", "--", "--", "--"},
        {"wp", "wp", "wp", "wp", "wp", "wp", "wp", "wp"},
        {"wR", "wN", "wB", "wQ", "wK", "wB", "wN", "wR"}        
    }

    gs.whiteToMove = true
    gs.moveLog = {}

    return gs
end


function GameState:drawGameState()
    self:drawBoard()
    self:drawPieces(self)
end


function GameState:drawBoard(self)
    for file = 1, DIM, 1 do
        for rank = 1, DIM, 1 do
            DrawSquare(rank, file)
        end
    end
end


function DrawSquare(rank, file)
    if isLightSquare(rank, file) then
        DrawLightSquare(rank, file)
    else
        DrawDarkSquare(rank, file)
    end
end


function DrawLightSquare(rank, file)
    local func = function() love.graphics.rectangle("fill", (file - 1)*SQSIZE, (rank - 1)*SQSIZE, SQSIZE, SQSIZE) end
    drawColored(119, 154, 88, func)
end

function DrawDarkSquare(rank, file)
    local func = function() love.graphics.rectangle("fill", (file - 1)*SQSIZE, (rank - 1)*SQSIZE, SQSIZE, SQSIZE) end
    drawColored(234, 235, 200, func)
end


function isLightSquare(rank, file)

    return (rank + file)%2 ~= 0
end

function drawColored(red, green, blue, func)
    love.graphics.setColor(love.math.colorFromBytes(red, green, blue))
    func()
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
end


function GameState:drawPieces()
    for file = 1, DIM, 1 do
         for rank = 1, DIM, 1 do
            self:DrawSquarePiece(file, rank)
         end
    end 
end


function GameState:DrawSquarePiece(rank, file)
    if (self.board[rank][file] ~= "--") then
        local img = IMAGES[self.board[rank][file]]

        local x = (file - 1)*SQSIZE
        local y = (rank - 1)*SQSIZE

        love.graphics.draw(img, x, y, nil, SQSIZE/img:getWidth(), SQSIZE/img:getHeight())
    end
end