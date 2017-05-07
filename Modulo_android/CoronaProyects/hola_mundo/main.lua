-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local alto = display.actualContentHeight
local ancho = display.actualContentWidth

local fondo = display.newRect( ancho/2, alto/2, ancho, alto )
fondo:setFillColor(1, 1, 1)
local rect = display.newRect(ancho/2, 0, ancho, 40 )
rect:setFillColor(0.4, 0.7, 0.3)

local texto = display.newText("Proyecto UIS", 70, 0, native.systemFont, 20)

local lblvalor1 = display.newText("Ingrese valor 1", 16, 50, native.systemFont, 14)
lblvalor1.anchorX = 0
lblvalor1.anchorY = 0
lblvalor1:setFillColor(0.3, 0.3, 0.3)

local lblvalor2 = display.newText("Ingrese valor 2", 16, 90, native.systemFont, 14)
lblvalor2.anchorX = 0
lblvalor2.anchorY = 0
lblvalor2:setFillColor(0.3, 0.3, 0.3)

local lblresultado = display.newText("Resultado: ", ancho/2, 200, native.systemFont, 14)
lblresultado:setFillColor(0.3, 0.3, 0.3)

local btncalcular = display.newRoundedRect(ancho/2, 150, 150, 35, 5 )
btncalcular:setFillColor(0.4, 0.7, 0.3)
local lblcalcular = display.newText("CALCULAR", ancho/2, 150, native.systemFont, 14)

local txtvalor1 = native.newTextField( 120, 45, 180, 30 )
txtvalor1.inputType = "number"
txtvalor1.anchorX = 0
txtvalor1.anchorY = 0

local txtvalor2 = native.newTextField( 120, 85, 180, 30 )
txtvalor2.inputType = "number"
txtvalor2.anchorX = 0
txtvalor2.anchorY = 0

function calcularValor(event)
	if (txtvalor1.text == "") then
		native.showAlert( "ERROR", "Debe escribir un valor")
		return
	end
	if (txtvalor2.text == "") then
		native.showAlert( "ERROR", "Debe escribir un valor")
		return
	end
	local num1 = txtvalor1.text
	local num2 = txtvalor2.text
	local resul = num1 - num2
	lblresultado.text = "Resultado: "..resul
end

btncalcular:addEventListener("tap", calcularValor)
