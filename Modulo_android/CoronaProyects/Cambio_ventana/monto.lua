
local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local alto = display.actualContentHeight
local ancho = display.actualContentWidth
local options = { params = "null"}

-- Corona trabaja el punto de referencia el centro
-- por ende el fondo debe de centrarse con ancho/ y alto/2
local fondo = display.newRect(ancho/2, alto/2, ancho, alto)
fondo:setFillColor(1, 1, 1)

-- EL orden en que se crean es el orden en que se agregan
-- OJO con la superposicion
local barraTitulo = display.newRect(ancho/2, 0, ancho, 50) -- X, Y , Ancho, Alto
barraTitulo:setFillColor(0.407, 0.694, 0.380)

-- Titulo de la app
local lbTitulo = display.newText("Billetera", 10, 0, native.systemFont, 15) -- Texto, X, Y, Fuente, Tamaño
lbTitulo.anchorX = 0

-- Letrero de Bienvenida
local lbBienvenida = display.newText("Bienvenido a su", ancho/2, 70, native.systemFont, 10)
lbBienvenida:setFillColor(0.3, 0.3, 0.3)

-- Label Monto1
local lbMonto = display.newText("0", ancho/2, 170, native.systemFont, 50)
lbMonto:setFillColor(0.4, 0.4, 0.4)

-- Boton Ingreso
local btIngreso = display.newRoundedRect(230, 360, 120, 40, 3)
btIngreso.id = "btIngreso"
btIngreso:setFillColor(0.407, 0.694, 0.380)
local lbBotonIngreso = display.newText("INGRESO", 230, 360, native.systemFont, 15)

-- Boton Egreso
local btEgreso = display.newRoundedRect(80, 360, 120, 40, 3)
btEgreso.id = "btEgreso"
btEgreso:setFillColor(0.407, 0.694, 0.380)
local lbBotonEgreso = display.newText("EGRESO", 80, 360, native.systemFont, 15)

-- Funcion para dirigir a ingreso y egreso
function cambio_ventana( event )

  if (event.target.id ==  btIngreso.id) then
    options.params = "Ingresos"
  end

  if(event.target.id == btEgreso.id) then
    options.params = "Egresos"
  end

--- ULTRA SUPER MEGA RE CONTRA DUDA ------------
-- LA DUDA CONSISTE EN COMO DESTRUIR LA PANTALLA ANTERIOR

  composer.gotoScene("insertar_monto", options)
  composer.removeScene("monto")

end

--Asignaicion de FUNCIONES
btIngreso:addEventListener("tap", cambio_ventana)
btEgreso:addEventListener("tap", cambio_ventana)

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen


end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print("d", event.agregarAlMonto)
        --lbMonto.text = event.agregarAlMonto
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen


    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
