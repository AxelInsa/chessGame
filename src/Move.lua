

Move = {}

function Move:new(startSq, endSq, board)

    rankToRowsTable = { {1, 8}, {2, 7}, {3, 6}, {4, 5}, {5, 4}, {6, 3}, {7, 2}, {8, 1} }
    rowsToRankTable = inverseKeyValue(rankToRowsTable)

    filesToColsTable = { {"a", 1}, {"b", 2}, {"c", 3}, {"d", 4}, {"e", 5}, {"f", 6}, {"g", 7}, {"h", 8} }
    colsToFilesTable = inverseKeyValue(filesToColsTable)

    rankToRows = Dictionary:new(rankToRowsTable)
    rowsToRank = Dictionary:new(rowsToRankTable)
    filesToCols = Dictionary:new(filesToColsTable)
    colsToFiles = Dictionary:new(colsToFilesTable)


    local move = {}
    setmetatable(move, self)
    self.__index = self

    move.startRow = startSq.row
    move.startCol = startSq.col
    move.endRow = endSq.row
    move.endCol = endSq.col

    move.board = board

    move.pieceMoved = move.board[move.startRow][move.startCol]
    move.pieceCaptured = move.board[move.endRow][move.endCol]


    return move
end


function Move:getChessNotation()
    return self:getRankFile(self.startRow, self.startCol)..self:getRankFile(self.endRow, self.endCol)
end


function Move:getRankFile(r, c)
    return colsToFiles:get(c)..rowsToRank:get(r)
end




function inverseKeyValue(list)
    
    local copy = deepcopy(list)
    for index, keyValue in pairs(copy) do
        
        keyValue[1], keyValue[2] = invertValues(keyValue[1], keyValue[2])
    end
    return copy
end

function invertValues(a, b)
    return b, a
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end