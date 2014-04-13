function love.load()
	width = 1024--Просьба об изменениях масштаба
	height = 512--говорить заранее
	love.window.setMode( width, height )
	chordherox = width/2-width/80/2--начальное положение
	chordheroy = height/2
	stepx = width/80
	stepy = height/25
	wall = {}
	inition_walls()
end

function love.keypressed(button)
	if (button == 'q') then
		if (chordherox-stepx>0 and chordheroy-stepy>0) and (wall[width/chordherox-stepx/80][height/chordheroy-stepy/25] ~= true)then
			chordherox = chordherox-stepx
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'w') then
		if chordheroy-stepy>0 then
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'e') then
		if chordherox+stepx<width and chordheroy-stepy>0 then
			chordherox = chordherox+stepx
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'a') then
		if chordherox-stepx>0 then
			chordherox = chordherox-stepx
		end
	end
	if (button == 'd') then
		if chordherox+stepx<width then
			chordherox = chordherox+stepx
		end
	end
	if (button == 'z') then
		if chordherox-stepx>0 and chordheroy+stepy<height then
			chordherox = chordherox-stepx
			chordheroy = chordheroy+stepy
		end
	end
	if (button == 'x') then
		if chordheroy+stepy<height then
			chordheroy = chordheroy+stepy
		end
	end
	if (button == 'c') then
		if chordherox+stepx<width and chordheroy+stepy<height then
			chordherox = chordherox+stepx
			chordheroy = chordheroy+stepy
		end
	end
end

function draw_wall()
	local wall_image = love.graphics.newImage("Images/wall.png")
	local dirt_image = love.graphics.newImage("Images/graw.png")
	--love.graphics.setColor( 255, 255, 255, 255 )
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
	love.graphics.draw( me_image, chordherox, chordheroy, 0, stepx/15.5, stepx/15.5, 7, 10)--look 66
end

function love.draw()
	draw_wall()
    draw_grid(80,25)
	draw_me()
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

function love.update(dt)
	
end