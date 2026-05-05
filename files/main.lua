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
-- Duas forma de construção: List-style e Record-style
local itemAvulso = { "A", "Letra B" } -- like Javascript Array - List-style
itemAvulso["CC"] = "Letra C"          -- like Javascript Object (Key String) - Record-style
itemAvulso[40] = "D"                  -- like Javascript Object (Key Number) - Record-style
itemAvulso.E = "Letra E"              -- like Javascript Objetc (key Variavel) - Record-style

print("Tables like Object => Key: CC | Valor: " .. itemAvulso.CC)
print("Tables like Object => Key: 40 | Valor: " .. itemAvulso[40])

-- Função IPAIRS >> Usado para extrair todos os itens de um Array numa iteração
for idx, line in ipairs(itemAvulso) do
	print("Tables For IPAIRS => Índice:", idx, "| Valor:", line)
end

-- Tipo "Functions"
-- Similar ao Javascript
local calcSum = function(param1, param2)
	print("Function => Resultado da Soma:", param1 + param2)
end

calcSum(15, 25)

-- com Callback
function ShowMax()
	return "Valor Maior que Zero"
end

function ShowMin()
	return "Valor Menor que Zero"
end

function ShowMain(paramFuncOk, paramFuncError, num)
	local res
	if num >= 0 then
		res = paramFuncOk()
	else
		res = paramFuncError()
	end
	print("Function => Valor: " .. tostring(num), "| Msg: " .. res)
end

ShowMain(ShowMax, ShowMin, -10)

-- Exclusão de uma Função
calcSum = nil
ShowMain = nil
ShowMax = nil
ShowMin = nil

-- Operadores Relacionais
-- ( < ,  > , <= , >= , == , ~= [tíl e igual])
local objA = {}
local objB = {}
objA.x = 10; objA.y = 5
objB.x = 10; objB.y = 5

local objC = objA

-- Objetos por Referência
if objA ~= objB then
	print("Comparativo => ObjA vs ObjB: \"Objetos Diferentes\" -", objA, objB)
end

if objA == objC then
	print("Comparativo => ObjA vs ObjC: \"Objetos Iguais\" -", objA, objC)
end

-- Operadores Lógicos
-- ( and , or , not )
local printSix = not false
if printSix then
	print("Operador => Msg: Valor 6 (seis) deve ser impresso.")
end

-- Atribuição com Desestruturação (Assignment Destructuring)
local letterA, letterB = "A", "B"
print("Desestruturação => Primeira Letra: " .. letterA .. ", Segunda Letra: " .. letterB)

letterA, letterB = letterB, letterA
print("Desestruturação (swap) => Primeira Inversão: " .. letterA .. ", Segunda Inversão: " .. letterB)

local letterC = "C", "D", "E"
print("Desestruturação (Descarte) => Terceira Letra:", letterC)

-- Controle de Estruturas
-- do, if, while, repet, for
-- break e return

-- Bloco local (do .. end)
do
	local letterD = "D"
end
print("Do .. end => Variavel de Bloco:", letterD) -- Valor nil

-- Condicional (if .. elseif .. else .. end)
local bairro = "Barra"
if bairro == "Bangu"
then
	print("If .. elseif .. else .. end => Bairro Mais Quente:", bairro)
elseif bairro == "Barra"
then
	print("If .. elseif .. else .. end => Bairro com Maior Custo/Benefício:", bairro)
elseif bairro == "Copacabana"
then
	print("If .. elseif .. else .. end => Bairro Mais Caro:", bairro)
else
	print("If .. elseif .. else .. end => Bairro Diferente:", bairro)
end

-- Iteração (while .. do .. end)
local doFirst = true
while doFirst do
	print("While .. do .. end => Primeiro:", doFirst)
	doFirst = nil
end

-- Iteração (repeat .. until)
local repeatFirst = false
repeat
	print("Repeat .. until => Não é o Primeiro:", repeatFirst)
until not repeatFirst

-- Iteração (Numeric for)
for idx = 1, 5, 1 do -- Terceiro parâmetro pode ser implícito ("+1")
	print("Numeric for => Posição:", idx)
	break            -- Sair
end

-- Iteração (Generic for)
-- Usado com Iterator (Ex.: PAIRS -> Key and Value)
local tAnimal = { "Cabra", "Cavalo" }
for key, value in pairs(tAnimal) do
	print("Generic for => Chave:", key, "| valor:", value)
end

-- Break e Return
-- break  => for, repeat, or while (somente)
-- return => function - COM ou SEM valor
repeat
	print("Break => Nr Repetições: 1 (UM)")
	break -- Sair
until true

local funRet = function()
	print("Function with Return => Retorno COM e/ou SEM valor:", true)
	do -- Retornar SEM Valor
		return
	end
	print("Function with Return => Não exibir esta mensagem:", true)
end

funRet()

-- Função com Multi-resultado
local setMultResult = function(a)
	-- (a) é opcional e "nil" quando NÃO informado
	local nrA, nrB = 25, 55
	return nrA, nrB
end

print("Nultiple Results Function => Valores retornados:", setMultResult())

-- COM descarte de valores retornados
local nrA = setMultResult()

-- Função com Multi-argumento (...)
-- Possui 1 (UMA) variavel interna: {...} -> Array
local setMultArgs = function(...)
	local args = { ... } -- Atribuição
	for idx, value in ipairs(args) do
		print("Variable Number of Arguments => Índice:", idx, "| Valor:", value)
	end
end

setMultArgs(150, 245)

-- Função com Argumentos Nomeados
local setNameArgs = function(id, marca, precoFinal)
	print("Named Arguments => ID:", tostring(id), "| Marca:", marca, "| Preço:", tostring(precoFinal))
end

local varNameArgs = { id = 1, marca = "Dell", valorNormal = nil, valorDesc = 2099.99 }
setNameArgs(varNameArgs.id, varNameArgs.marca, varNameArgs.valorNormal or varNameArgs.valorDesc)

-- Escopo Léxico (Lexical Scoping)
local objPerson = {
	nome = "Alexandre",
	getIdade = function(anoNasc)
		local anoAtual = 2026
		return anoAtual - anoNasc
	end
}

print("Lexical Scorping => Nome:", objPerson.nome, "| Idade:", objPerson.getIdade(1985))

-- Função com Closure
local funcGlobal = function(nomeTime, anoCampeonato)
	local ultAno = 2026 - anoCampeonato
	return function() -- Closure -> Função Anônima
		print("Function with Closure => Time:", nomeTime, "| Tempo do Título:", ultAno, "ano(s)")
	end
end

local funcClosure = funcGlobal("Palmeiras", 2025)
funcClosure()

--[[
Onde parei...
https://www.lua.org/pil/6.1.html
]]
