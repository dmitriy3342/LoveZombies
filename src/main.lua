function love.load()
	width = 1024--Просьба об изменениях масштаба
	height = 512--говорить заранее
	love.window.setMode( width, height )
	chordherox = 40--начальное положение
	chordheroy = 12
	stepx = width/80
	stepy = height/25
	wall = {}
	zombies = {}
	sum_zombies = 1 -- количество зомби
	start_level = false
	x = "x"--координаты для зомбарей
	y = "y"--
	have_zombies = true
end

function zoom(chordx, chordy)
	return (chordx-1)*stepx, (chordy-1)*stepy
end

function love.keypressed(button)
	local movehero = false -- датчик движения героя
	if (button == 'q') then
		if (chordherox-1>0 and chordheroy-1>0) and (wall[chordherox-1][chordheroy-1] == false) then
			chordherox = chordherox-1
			chordheroy = chordheroy-1
			movehero = true
		end
	end
	if (button == 'w') then
		if chordheroy-1>0 and wall[chordherox][chordheroy-1] == false then
			chordheroy = chordheroy-1
			movehero = true
		end
	end
	if (button == 'e') then
		if chordherox+1<81 and chordheroy-1>0 and (wall[chordherox+1][chordheroy-1] == false) then
			chordherox = chordherox+1
			chordheroy = chordheroy-1
			movehero = true
		end
	end
	if (button == 'a') then
		if chordherox-1>0 and (wall[chordherox-1][chordheroy] == false) then
			chordherox = chordherox-1
			movehero = true
		end
	end
	if (button == 'd') then
		if chordherox+1<81 and (wall[chordherox+1][chordheroy] == false)then
			chordherox = chordherox+1
			movehero = true
		end
	end
	if (button == 'z') then
		if chordherox-1>0 and chordheroy+1<26 and (wall[chordherox-1][chordheroy+1] == false)then
			chordherox = chordherox-1
			chordheroy = chordheroy+1
			movehero = true
		end
	end
	if (button == 'x') then
		if chordheroy+1<26 and (wall[chordherox][chordheroy+1] == false) then
			chordheroy = chordheroy+1
			movehero = true
		end
	end
	if (button == 'c') then
		if chordherox+1<81 and chordheroy+1<26  and (wall[chordherox+1][chordheroy+1] == false) then
			chordherox = chordherox+1
			chordheroy = chordheroy+1
			movehero = true
		end
	end
	
	if movehero == true then
		move_zombies()
		dead_zombies()
	end
end

function move_zombies()
	for i = 1, sum_zombies do
		if zombies[i] ~= "Dead" then
			if zombies[i][x]-chordherox>0 then
				zombies[i][x] = zombies[i][x]-1
			else
				zombies[i][x] = zombies[i][x]+1
			end
			if zombies[i][y]-chordheroy>0 then
				zombies[i][y] = zombies[i][y]-1
			else
				zombies[i][y] = zombies[i][y]+1
			end
			
			if (zombies[i][x] > 80 or zombies[i][y] > 25 ) or (zombies[i][x] < 1 or zombies[i][y] < 1 ) then
				if zombies[i][x] > 80 then
					zombies[i][x] = zombies[i][x] - 2
				end
				if zombies[i][x] < 1 then
					zombies[i][x] = zombies[i][x] + 2
				end
				if zombies[i][y] > 25 then
					zombies[i][y] = zombies[i][y] - 2
				end
				if zombies[i][y] < 1 then
					zombies[i][y] = zombies[i][y] + 2
				end
			end
		end
	end
end

function dead_zombies()
	start_level = false
	for i = 1, sum_zombies do
		if zombies[i] ~= "Dead" then
			if wall[zombies[i][x]][zombies[i][y]] == true then
				local chordx = zombies[i][x]
				local chordy = zombies[i][y]
				while wall[chordx][chordy] == true do
					wall[chordx][chordy] = false
					chordx = chordx+1
				end
				chordx = zombies[i][x]-1
				while wall[chordx][chordy] == true do
					wall[chordx][chordy] = false
					chordx = chordx-1
				end
				zombies[i] = "Dead"
			else
				start_level = true
			end
		end
	end
end
		
function draw_wall()
	local wall_image = love.graphics.newImage("Images/wall.png")
	local dirt_image = love.graphics.newImage("Images/graw.png")
	love.graphics.setColor( 200, 200, 200, 255 )
	for i = 1, 80 do
		for j = 1, 25 do
			if wall[i][j] == true then
				love.graphics.draw( wall_image, (i-1)*(stepx), (j-1)*(stepy), 0, stepx/15.5, stepy/25, 0, 0)--508.5/height, 2048/(width*2) - масштабирование для нашего разрешения для изображений 25x15
				else
				love.graphics.draw( dirt_image, (i-1)*(stepx), (j-1)*(stepy), 0, stepx/15.5, stepy/25, 0, 0)
			end
		end
	end
end

function draw_grid(line_width , line_height)--Функция рисующая сетку
	love.graphics.setColor( 50, 50, 50, 255 )
    linex = stepx 
    liney = stepy 
    for i=0,(line_height-2) do
        love.graphics.line(0,liney,width,liney)
        liney = liney+stepy
    end
    for i=0,(line_width-2) do
        love.graphics.line(linex,0,linex,height)
        linex = linex+stepx
    end
end

function draw_me()
	local me_image = love.graphics.newImage("Images/human.png")
	love.graphics.setColor( 200, 200, 200, 255 )
	local chordx, chordy = zoom(chordherox, chordheroy)
	love.graphics.draw( me_image, chordx, chordy, 0, stepx/15.5, stepy/25, 0, 0)
end

function draw_zombies()
	love.graphics.setColor( 0, 255, 0, 255 )
	zombie_image = love.graphics.newImage("Images/zombie.png")
	for i = 1, sum_zombies do
		if (zombies[i] ~= "Dead") then
			local chordx, chordy = zoom(zombies[i][x], zombies[i][y])
			love.graphics.draw( zombie_image, chordx, chordy, 0, stepx/15.5, stepx/15.5, 0, 0)
		end
	end
end

function love.draw()
	if start_level == true then
		draw_wall()
		love.graphics.print(chordherox, 10, 5)
		love.graphics.print(chordheroy, 30, 5)
		draw_grid(80,25)
		draw_me()
		draw_zombies()
	else
		start_levels()
	end
end

function inition_walls()
	for i = 1, 80 do
		wall[i] = {}
		for j = 1, 25 do
			if j%2 == 0 and i%5 ~= 0 then
				wall[i][j] = true
			else
				wall[i][j] = false
			end
		end
	end
end

function inition_zombies()
	for i = 1, sum_zombies do
		zombies[i] = {}
		zombies[i][y] = math.random(1, 25)
		if zombies[i][y] % 2 == 0 then
			zombies[i][x] = math.random(1, 16)*5
		else
			zombies[i][x] = math.random(1, 80)
		end
	end
end

function start_levels()
	sum_zombies = sum_zombies+4
	inition_walls()
	inition_zombies()
	chordherox = 40
	chordheroy = 12
	start_level = true
end

function love.update(dt)
	
end