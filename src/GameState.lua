

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


-- Undo last move
function GameState:undoMove()
    local nbrMove = len(self.moveLog)
    if(nbrMove ~= 0) then
        local move = table.remove(self.moveLog, nbrMove)
        self.board[move.startRow][move.startCol] = move.pieceMoved
        self.board[move.endRow][move.endCol] = move.pieceCaptured
        self.whiteToMove = not self.whiteToMove
    end
end


--Takes a move as a parameter and execute it. Won't work for castling and en-passant
function GameState:makeMove(move)
    print(move:getChessNotation())
    self.board[move.startRow][move.startCol] = "--"
    self.board[move.endRow][move.endCol] = move.pieceMoved
    table.insert(self.moveLog, move)
    self.whiteToMove = not self.whiteToMove
end


-- Draw the board + draw the pieces
function GameState:drawGameState()
    self:drawBoard()
    self:drawPieces(self)
end


-- Draw the pieces
function GameState:drawPieces()
    for file = 1, DIM, 1 do
         for rank = 1, DIM, 1 do
            self:DrawSquarePiece(file, rank)
         end
    end 
end


-- Draw a piece at a certain square defined by rank and file.
function GameState:DrawSquarePiece(rank, file)
    if (self.board[rank][file] ~= "--") then
        local img = IMAGES[self.board[rank][file]]

        local x = (file - 1)*SQSIZE
        local y = (rank - 1)*SQSIZE

        love.graphics.draw(img, x, y, nil, SQSIZE/img:getWidth(), SQSIZE/img:getHeight())
    end
end


-- Draw the board
function GameState:drawBoard(self)
    for file = 1, DIM, 1 do
        for rank = 1, DIM, 1 do
            DrawSquare(rank, file)
        end
    end
end


-- Draw a square
function DrawSquare(rank, file)
    if isLightSquare(rank, file) then
        DrawLightSquare(rank, file)
    else
        DrawDarkSquare(rank, file)
    end
end


-- Draw a light square
function DrawLightSquare(rank, file)
    local func = function() love.graphics.rectangle("fill", (file - 1)*SQSIZE, (rank - 1)*SQSIZE, SQSIZE, SQSIZE) end
    drawColored(119, 154, 88, func)
end


-- Draw a black square
function DrawDarkSquare(rank, file)
    local func = function() love.graphics.rectangle("fill", (file - 1)*SQSIZE, (rank - 1)*SQSIZE, SQSIZE, SQSIZE) end
    drawColored(234, 235, 200, func)
end


-- return true if the square is light else false
function isLightSquare(rank, file)
    return (rank + file)%2 ~= 0
end

