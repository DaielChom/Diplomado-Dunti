-- pantalla1.lua
------------------------------------------
local composer = require("composer")
local widget = require( "widget" )
local scene = composer.newScene()

display.setStatusBar( display.DefaultStatusBar )
local W = display.contentWidth
local H = display.contentHeight
--local E = 44

local fondo = display.newRect(0, 0, W, H)
fondo.anchorX, fondo.anchorY = 0, 0
fondo:setFillColor(1, 1, 1)

local sombra = display.newRect(0, 0, W, 40+2)
sombra.anchorX = 0
sombra.anchorY = 0
sombra:setFillColor(0.75, 0.75, 0.75, 0.5)
local barra = display.newRect(0, 0, W, 40)
barra.anchorX = 0
barra.anchorY = 0
barra:setFillColor(0.41, 0.71, 0.27)

local titulo = display.newText("Programa", 40, 10, native.systemFont, 16)
titulo.anchorX = 0
titulo.anchorY = 0

local imgdehaze = display.newImageRect("imgs/dehaze.png", 24, 24)
local gris
local grupomenu
function presentarMenu(event)
	if (event.phase == "ended") then
		transition.moveTo( gris, { x=W/2, alpha=1, time=200 } )
		transition.moveTo( grupomenu, { x=W/2, time=200 } )
	end
end

function ocultarMenu(event)
	transition.moveTo( gris, { x=-(W/2), alpha=0, time=200 } )
	transition.moveTo( grupomenu, { x=-(W/2), time=200 } )
end

function hacerOtracosa(event)
	print("hola")
end


local btndehaze = widget.newButton(
    {
        label = "",
        onEvent = presentarMenu,
        emboss = true,
        shape = "circle",
        radius = 20,
        fillColor = { default={0.41, 0.71, 0.27, 0.1}, over={0.46, 0.76, 0.32} },
    }
)
btndehaze.anchorX = 0
btndehaze.anchorY = 0
imgdehaze.anchorX = 0
imgdehaze.anchorY = 0
btndehaze.x = 0
btndehaze.y = 0
imgdehaze.x = 8
imgdehaze.y = 8

gris = display.newRect(0,0,W*1.5,H)
gris.anchorX = 0
gris.anchorY = 0
gris.alpha = 0
gris:setFillColor(0,0,0,0.5)
gris:addEventListener("tap", ocultarMenu)

local sombramenu = display.newRect(-(W/2), 0, W/2+2, H)
sombramenu.anchorX = 0
sombramenu.anchorY = 0
sombramenu:setFillColor(0.75, 0.75, 0.75, 0.5)
local menu = display.newRect(-(W/2), 0, W/2, H)
menu.anchorX = 0
menu.anchorY = 0
menu:addEventListener("tap", hacerOtracosa)

local opcion1 = display.newText("Opción 1", -(W/2)+10, 10, native.systemFont, 10)
opcion1.anchorX = 0
opcion1.anchorY = 0
opcion1:setFillColor(0,0,0)
grupomenu = display.newGroup()
grupomenu:insert(sombramenu)
grupomenu:insert(menu)
grupomenu:insert(opcion1)


local card = display.newContainer(250, 150)
card.x = 150
card.y = 150
local fondocard = display.newRoundedRect(0, 0, 248, 148, 5)
fondocard:setFillColor(0.8 ,0.8 ,1)
local fondocardsombra = display.newRoundedRect(0, 0, 250, 150, 5)
fondocardsombra:setFillColor(0.75 ,0.75 ,0.75, 0.5)
card:insert(fondocardsombra)
card:insert(fondocard)
local circ
local function aparecercirc(event)
	print("Se presionó la tarjeta")
	circ.x = event.x - card.x
	circ.y = event.y - card.y
	circ.alpha = 0.5
	transition.to( circ, { height=300, width = 300, alpha=0, time=200 } )
	circ = nil
	circ = display.newCircle(0,0,20)
	circ:setFillColor(1,1,1)
	circ.alpha = 0
	card:insert(circ)
end
circ = display.newCircle(0,0,20)
circ:setFillColor(1,1,1)
circ.alpha = 0
card:insert(circ)
local texto = display.newText("Prueba", 10, 10, native.systemFont, 12)
texto:setFillColor(0,0,0)
card:insert(texto)
fondocard:addEventListener("tap", aparecercirc)

function scene:create(event)
	local grupo = self.view
	grupo:insert(fondo)
	grupo:insert(sombra)
	grupo:insert(barra)
	grupo:insert(titulo)
	grupo:insert(card)
	grupo:insert(btndehaze)
	grupo:insert(imgdehaze)
	grupo:insert(gris)
	grupo:insert(grupomenu)
end

function scene:destroy(event)

end

-- INCLUSIÓN DE LISTENERS Y GENERACIÓN DE LA PANTALLA
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

return scene
