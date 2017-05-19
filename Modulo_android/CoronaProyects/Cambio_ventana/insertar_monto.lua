local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local alto = display.actualContentHeight
local ancho = display.actualContentWidth
local options = {agregarAlMonto = "0"}

local fondo = display.newRect(ancho/2, alto/2, ancho, alto)
fondo:setFillColor(1, 1, 1)

local barraTitulo = display.newRect(ancho/2, 0, ancho, 50) -- X, Y , Ancho, Alto
barraTitulo:setFillColor(0.407, 0.694, 0.380)

-- Titulo de la app
local lbTitulo = display.newText("Billetera", 10, 0, native.systemFont, 15) -- Texto, X, Y, Fuente, Tamaño
lbTitulo.anchorX = 0

local txmonto = native.newTextField(ancho/2, 230, 180, 20)

local lbTitulo = display.newText("0", ancho/2, 150, native.systemFont, 30)
lbTitulo:setFillColor(0.3, 0.3, 0.3)

local lbBienvenida = display.newText("Por favor agregue sus ",  ancho/2, 70, native.systemFont, 10)
lbBienvenida:setFillColor(0.5, 0.5, 0.5)

local btAgregar = display.newRoundedRect(ancho/2, 300, 120, 40 , 2)
btAgregar:setFillColor(0.407, 0.694, 0.380)

local lbBotonAgregar = display.newText("AGREGAR", ancho/2, 300, native.systemFont, 15)

function agregar_monto ( event )

  if(txmonto.text=="") then
    print("Error")

else
  options.agregarAlMonto = txmonto.text
  print("s", options.agregarAlMonto)
  composer.gotoScene("monto", options)
  composer.removeScene("insertar_monto")
  end


end

btAgregar:addEventListener("tap", agregar_monto)


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
        lbTitulo.text = event.params


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
