local pl = {}

function pl.load()
  pl.x = 100
  pl.y = 200
  pl.vel = 300
  pl.width = 70
  pl.height = 70
end

function pl.update(dt)
  local dir
  if love.keyboard.isDown('d') then dir = 1
  elseif love.keyboard.isDown('a') then dir = -1
  else dir = 0
  end
  pl.x = pl.x + dt*pl.vel*dir
  if love.keyboard.isDown('s') then dir = 1
  elseif love.keyboard.isDown('w') then dir = -1
  else dir = 0
  end
  pl.y = pl.y + dt*pl.vel*dir
end

function pl.draw()
  love.graphics.rectangle('fill',pl.x,pl.y,pl.width,pl.height)
end

return pl