local game = {}

local player = require'src/player'

local bg
local bg_scale

local offsetx, offsety = 0,0
local w,h
local arena_w, arena_h

local vida_max = 3
local vida = vida_max

function game.load()
  bg = love.graphics.newImage('assets/background.png')
  local iw,ih = bg:getDimensions()
  w,h = love.graphics.getDimensions()
  --bg_scale = w/iw
  bg_scale = 2
  arena_w = iw * bg_scale
  arena_h = ih * bg_scale
  player.load()
end

function game.update(dt)
  player.update(dt)
  offsetx = player.x - w/2
  offsety = player.y - h/2
  
  if offsetx < 0 then
    offsetx = 0
  elseif offsetx+w > arena_w then
    offsetx = arena_w - w
  end
  if offsety < 0 then
    offsety = 0
  elseif offsety+h > arena_h then
    offsety = arena_h - h
  end
end

function game.loseLife()
  vida = vida-1
  if vida<= 0 then
    vida = vida_max
    player.x = 0
    player.y = 0
  end
end

function game.keypressed(key)
  if key == 'p' then
    game.loseLife()
  end
end

function game.hudDraw()
  for i=0,vida-1 do
    love.graphics.rectangle('line',20+i*50,20,50,50)
  end
end

function game.draw()
  love.graphics.push()
    love.graphics.translate(-offsetx,-offsety)
    love.graphics.draw(bg,0,0,0,bg_scale)
    player.draw()
  love.graphics.pop()
  game.hudDraw()
end

function game.mousepressed(x,y,b)
  
end

return game