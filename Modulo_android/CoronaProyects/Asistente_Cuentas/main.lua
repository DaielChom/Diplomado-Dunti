-----------------------------------------------------------------------------------------
-- By: DaielChom
-- main.lua
--
-----------------------------------------------------------------------------------------
--Librerias
local widget = require( "widget" )

local alto = display.actualContentHeight
local ancho = display.actualContentWidth

-- Corona trabaja el punto de referencia el centro
-- por ende el fondo debe de centrarse con ancho/ y alto/2
local fondo = display.newRect(ancho/2, alto/2, ancho, alto)
fondo:setFillColor(1, 1, 1)

-- EL orden en que se crean es el orden en que se agregan
-- OJO con la superposicion
local barraTitulo = display.newRect(ancho/2, 0, ancho, 50) -- X, Y , Ancho, Alto
barraTitulo:setFillColor(0.407, 0.694, 0.380)

-- Titulo de la app
local lbTitulo = display.newText("Asistente Cuentas", 10, 0, native.systemFont, 15) -- Texto, X, Y, Fuente, Tamaño
lbTitulo.anchorX = 0


-- Se define el radioGroup
local radioGroup = display.newGroup()

-- Se crean los radioButon
-- RadioButton ingresos
local rbIngresos = widget.newSwitch( {
        left = 100,
        top = 260,
        style = "radio",
        initialSw5tchState = false,
        width= 20,
        height= 20,
      })
-- RadioButton Egresos
local rbEgresos = widget.newSwitch ({
  left = 100,
  top = 290,
  style = "radio",
  initialSwitchState = false,
  width= 20,
  height= 20,
  })

-- Por ultimo se agregan al buttonGroup
radioGroup:insert( rbIngresos )
radioGroup:insert( rbEgresos )

local lbIngresos = display.newText("Ingreso", ancho/2, 270, native.systemFont, 15)
lbIngresos:setFillColor(0.6, 0.6, 0.6)

local lbEgreso = display.newText("Egreso", ancho/2, 300, native.systemFont, 15)
lbEgreso:setFillColor(0.6, 0.6, 0.6)

-- Lable Bienvenido
local lbBienvenida = display.newText("Bienvenido a su assitente de cuentas", ancho/2, 70, native.systemFont, 10)
lbBienvenida:setFillColor(0.3, 0.3, 0.3)

-- Label Monto1
local lbMonto = display.newText("0", ancho/2, 170, native.systemFont, 50)
lbMonto:setFillColor(0.4, 0.4, 0.4)

-- TextField Mondo0
local txMonto = native.newTextField(ancho/2, 230, 180, 20)


-- Boton
local btCalcular = display.newRoundedRect(ancho/2, 360, 120, 40, 3)
btCalcular:setFillColor(0.407, 0.694, 0.380)
local lbBoton = display.newText("CALCULAR", ancho/2, 360, native.systemFont, 15)

---- Funciones
function agregarMonto( event )

  if(txMonto.text == "") then
    native.showAlert("ERRO", "Debe Ingresar un monto")
    return
  end

  if(rbIngresos.isOn == false and rbEgresos.isOn == false) then
  native.showAlert("ERROR", "Seleccione el tipo de monto")
  return
  end

  if(rbIngresos.isOn) then
  lbMonto.text = lbMonto.text + txMonto.text
  end

if(rbEgresos.isOn) then
lbMonto.text = lbMonto.text - txMonto.text
end

if(tonumber(lbMonto.text) < 0) then
  lbMonto:setFillColor(171/255, 50/255, 38/255)
end

if(tonumber(lbMonto.text) > 0) then
lbMonto:setFillColor(0.407, 0.694, 0.380)
end

end

----- Asignafunciones
btCalcular:addEventListener("tap", agregarMonto)
