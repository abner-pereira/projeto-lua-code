--[[
	Comentário de Bloco
	print("Olá Lua!")
]]
-- Comentário de Linha

-- Variavel Global
Nome = "Júlio"

-- Variavel Local
local sobreNome = "Santos"

-- Tipos e Valores
-- Função TYPE >> Retorna o "Nome do Tipo"
print("Valor:", sobreNome, "| Tipo:", type(sobreNome)) -- string
print("Valor:", 100, "| Tipo:", type(100))             -- number
print("Valor:", true, "| Tipo:", type(true))           -- boolean
print("Valor:", nil, "| Tipo:", type(nil))             -- null/delete

local show = print
print("Valor:", show, "| Tipo:", type(show)) -- function

-- Exclusão de Variavel (Limeza de Memória)
Nome = nil
print("Deleção:", Nome)

-- Nas condicionais, somente os valores FALSE e NIL são considerados falsos.
-- Os demais valores são considerados verdadeiros.
local idade -- nil
if not idade then
	print("Idade Ok:", false)
end

-- Tipo "Number" >> Todos os valores são considerados reais (NÃO existem inteiros)
idade = 4
idade = 4.5
idade = 0.45e+3
print("Idade Definida:", idade)

-- Tipo "String" >> São imutáveis (uma vez atribuida NÃO é possivel alterar)
-- \a - bell
-- \b - back space
-- \f - form feed
-- \n - newline
-- \r - carriage return
-- \t - horizontal tab
-- \v - vertical tab
local textoPoema = "\tPegue uma maça.\n\tSente na janela\n\te veja o pôr-do-sol.\n\t(\"Desconhecido\")\n"
print(textoPoema)

local textoFragmentado = [[
		Maria foi a feira.
		Entretanto, lá não havia o que ela queria.
		Sendo assim, ela voltou para casa.
]]
print(textoFragmentado)

-- Concatenação ( .. )
local nomeCompleto = "Sônia " .. sobreNome
print("Concatenação => Nome Completo: " .. nomeCompleto)

-- Conversão
if 10 ~= tostring(10) then
	print("Comparação TOSTRING => Valor 10 DIFERENTE \"10\"")
end

if "15" ~= tonumber("15") then
	print("Comparação TONUMBER => Valor \"15\" DIFERENTE 15")
end

-- Tipo "Tables" - Similaridade ao "Objeto" em Javascript
-- Índice começando com 1 (UM)
-- NÃO EXISTE campo de armazenamento contendo o tamanho do Array
local itemAvulso = { "A", "Letra B" } -- like Javascript Array
itemAvulso["CC"] = "Letra C"          -- like Javascript Object (Key String)
itemAvulso[40] = "D"                  -- like Javascript Object (Key Number)
itemAvulso.E = "Letra E"              -- like Javascript Objetc (key Variavel)

print("Tables like Object => Key: CC | Valor: " .. itemAvulso.CC)
print("Tables like Object => Key: 40 | Valor: " .. itemAvulso[40])

-- Função IPAIRS >> Usado para extrair todos os itens de um Array numa iteração
for idx, line in ipairs(itemAvulso) do
	print("Tables For IPAIRS >> Índice:", idx, "| Valor:", line)
end

--[[
Onde parei...
https://www.lua.org/pil/2.6.html
]]
