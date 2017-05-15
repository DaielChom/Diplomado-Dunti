-- main.lua
-----------------------------------------------------------------------------------------
-- Chicos, si usan multipantalla, este debe ser el MÉTODO DE ARRANQUE. 
-- Traten de NO colocar elementos aquí, para hacer la pantalla inicial 
-- hagan una pantalla inicial por aparte y la llaman desde aquí

local composer = require ("composer")

local opc = {
	effect = "fade",     -- <-este es el efecto con el que se puede presentar la pantalla siguiente
	time = 1000          -- <-este es el tiempo en milisegundos que dura la aplicación del efecto
}
composer.gotoScene("splash", opc)
--                    ^
--                    |
--   este es el nombre del archivo .lua de la pantalla a donde se redirige