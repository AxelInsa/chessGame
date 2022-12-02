

ClickHandler = {}

function ClickHandler:new()
    
    local ch = {}
    setmetatable(ch, self)
    self.__index = self

    ch.sqSelected = {}
    ch.playerClicks = {}

    return ch
end

function ClickHandler:updateClicks(x, y)
    col, row = self:getColRow(x, y)

    if(self.sqSelected.col == col and self.sqSelected.row == row) then
        self:resetClicks()
    else
        self:setSqSelected(col, row)
        self:addClick()
    end
end


function ClickHandler:addClick()
    table.insert(self.playerClicks, self.sqSelected)
end


function ClickHandler:isTimeToMove()
    return len(self.playerClicks) == 2
end


function ClickHandler:getColRow(x, y)
    col = math.floor(x/SQSIZE, -0.5) + 1
    row = math.floor(y/SQSIZE, -0.5) + 1

    return col, row
end


function ClickHandler:resetClicks()
    self.sqSelected = {}
    self.playerClicks = {}
end


function ClickHandler:setSqSelected(col, row)
    self.sqSelected = {col=col, row=row}
end