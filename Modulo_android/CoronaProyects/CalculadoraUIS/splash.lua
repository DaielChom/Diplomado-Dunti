-- splash.lua
------------------------------------------
local composer = require("composer")
local scene = composer.newScene()

-- LUGAR PARA COLOCAR LOS ELEMENTOS DE LA PANTALLA Y LAS FUNCIONES
local logo = display.newImageRect("imgs/logouis.png", 200, 120)
logo.x = display.contentCenterX
logo.y = display.contentCenterY

function redirigir()
	local opc = {
		effect = "fade",     -- <-este es el efecto con el que se puede presentar la pantalla siguiente
		time = 1000          -- <-este es el tiempo en milisegundos que dura la aplicación del efecto
	}
	composer.gotoScene("pantalla1", opc)
end

-- FUNCIÓN DE CREACIÓN DE LA PANTALLA
function scene:create(event)
	local grupo = self.view
	grupo:insert(logo)
end

-- FUNCION DE PRESENTACIÓN DE LA PANTALLA
function scene:show(event)
	local grupo = self.view
	local phase = event.phase
	if (phase=="did") then
		timer.performWithDelay(500, redirigir)
	end
end

-- FUNCIÓN DE DESTRUCCIÓN DE PANTALLA
function scene:destroy(event)

end

-- INCLUSIÓN DE LISTENERS Y GENERACIÓN DE LA PANTALLA
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene