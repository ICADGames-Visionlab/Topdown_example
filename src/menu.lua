local mn = {}

local playBut

function mn.load()
  playBut = {
    x = 120,
    y = 300,
    width = 200,
    height = 150
  }
end

local function rectHasPoint(rx,ry,rw,rh,px,py)
  if px > rx and px < rx+rw and py > ry and py < ry+rh then
    return true
  else
    return false
  end
end

function mn.update(dt)
  
end

function mn.keypressed(key)
end

function mn.mousepressed(x,y,b)
  local hasPoint = rectHasPoint(playBut.x,playBut.y,playBut.width,playBut.height,x,y)
  if hasPoint == true then
    love.changeToGame()
  end
end

function mn.draw()
  love.graphics.rectangle('fill',playBut.x,playBut.y,playBut.width,playBut.height)
end

return mn