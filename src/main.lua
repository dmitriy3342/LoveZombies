function love.load()
	width = 1244
	height = 600
	love.window.setMode( width, height )
	chordherox = width/2-width/80/2--рисуем начальное положение
	chordheroy = height/2
	stepx = width/80
	stepy = height/25
	zombies = {}
end

function love.keypressed(button)
	if (button == 'q') then
		if chordherox-stepx>0 and chordheroy-stepy>0 then
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

function draw_me()--Рисуем Player(игрока)
	image = love.graphics.newImage("Images/human.png")
	love.graphics.setColor( 200, 200, 200, 255 )
	love.graphics.draw( image, chordherox, chordheroy, 0, 1, 1, 7, 10)
	--love.graphics.circle("fill", chordherox, chordheroy, 5, 100)
end

function create_zombies()--Создаем зомби
    local t={}
    t.x=math.random(79)*stepx
    t.y=math.random(24)*stepy
    t.d_glavn=0
    t.d_poboch=0
    local dx = math.random(150)
    if dx<50 then
    	vx =
    return t
end

function draw_zombies()--Рисуем зомби
	love.graphics.setColor( 0, 255, 0, 255 )
	love.graphics.rectangle("fill", stepx*40+2, stepy*14+2, stepx-4, stepy-4)
end

function love.draw()
    draw_grid(80,25)
	draw_me()
	draw_zombies()
end



function love.update(dt)


end