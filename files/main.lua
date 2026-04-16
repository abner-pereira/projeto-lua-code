--[[
	Comentário de Bloco
	print("Olá Lua!")
]]
-- Comentário de Linha
print("Digite seu nome: ")

-- Global Variables
Nome = io.read("*l") --"*l" >> ler até o final da linha

-- Local Variables
local sobreNome = "Santos"

print("Seu nome é", Nome, "!")

-- Types and Values
-- Function Type >> Return type name
print("Valor:", sobreNome, "| Tipo:", type(sobreNome)) -- string
print("Valor:", 100, "| Tipo:", type(100))             -- number
print("Valor:", true, "| Tipo:", type(true))           -- boolean
print("Valor:", nil, "| Tipo:", type(nil))             -- null

local show = print
print("Valor:", show, "| Tipo:", type(show)) -- function

--[[
Marcador - Onde paramos...
https://www.lua.org/pil/2.html
]]
