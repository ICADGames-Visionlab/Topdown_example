local menu = require 'src/menu'
local game = require 'src/game'

local state

function love.load()
  menu.load()
  game.load()
  state = menu
end

function love.mousepressed(x,y,b)
  state.mousepressed(x,y,b)
end

function love.keypressed(key)
  state.keypressed(key)
end

function love.changeToGame()
  state = game
end

function love.update(dt)
  state.update(dt)
end

function love.draw()
  state.draw()
end