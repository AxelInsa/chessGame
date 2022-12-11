

BOARD = {}

function BOARD:new()

    local board = {}
    setmetatable(board, self)
    self.__index = self

    board.squares = {}

    board:init()
    --board:print()
    board:create()


    return board
end


function BOARD:init()
    self.squares = {}
    
    for col = 0, COLS - 1, 1 do
        table.insert(self.squares, {0, 0, 0, 0, 0, 0, 0, 0})
    end    
end


function BOARD:create()
    for index, row in pairs(self.squares) do
        for col, square in pairs(row) do
           square = SQUARE:new(row, square) 
        end
    end
end


function BOARD:addPieces(color)
    
end


function BOARD:print()
    for i, rank in pairs(self.squares) do
        for j, case in pairs(rank) do
            io.write(case.." ")
        end
        io.write("\n")
    end    
end
