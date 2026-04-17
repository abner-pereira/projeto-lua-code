--[[
	Comentário de Bloco
	print("Olá Lua!")
]]
-- Comentário de Linha

-- Global Variables
Nome = "Júlio"

-- Local Variables
local sobreNome = "Santos"

-- Types and Values
-- Function Type >> Return type name
print("Valor:", sobreNome, "| Tipo:", type(sobreNome)) -- string
print("Valor:", 100, "| Tipo:", type(100))             -- number
print("Valor:", true, "| Tipo:", type(true))           -- boolean
print("Valor:", nil, "| Tipo:", type(nil))             -- null

local show = print
print("Valor:", show, "| Tipo:", type(show)) -- function

--[[
Onde parei...
https://www.lua.org/pil/2.1.html
]]
