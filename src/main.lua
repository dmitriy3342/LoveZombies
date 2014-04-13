function love.load()
	width = 1244
	height = 600
	love.window.setMode( width, height )
	chordherox = width/2
	chordheroy = height/2
	stepx = width/80
	stepy = height/25
end

function love.keypressed(button)
	if (button == 'q')
		if chordherox-stepx>0 and chordheroy-stepy>0 then
			chordherox = chordherox-stepx
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'w')
		if chordheroy-stepy>0 then
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'e')
		if chordherox+stepx<width and chordheroy-stepy>0 then
			chordherox = chordherox+stepx
			chordheroy = chordheroy-stepy
		end
	end
	if (button == 'a')
		if chordherox-stepx>0 then
			chordherox = chordherox-stepx
		end
	end
	if (button == 'd')
		if chordherox+stepx<width then
			chordherox = chordherox+stepx
		end
	end
	if (button == 'z')
		if chordherox-stepx>0 and chordheroy+stepy<height then
			chordherox = chordherox-stepx
			chordheroy = chordheroy+stepy
		end
	end
	if (button == 'x')
		if chordheroy+stepy<height then
			chordheroy = chordheroy+stepy
		end
	end
	if (button == 'c')
		if chordherox+stepx<width and chordheroy+stepy<height then
			chordherox = chordherox+stepx
			chordheroy = chordheroy+stepy
		end
	end
end

