--[[
	Block Comments (Bloco de Comentários)
	print("Olá Lua!")
]]
-- Line Comments (Linha de Comentários)

-- Global Variables
Nome = "Júlio"

-- Local Variables
local sobreNome = "Santos"

-- Types and Values
-- Função TYPE >> Retorna o "Nome do Tipo"
print("Valor:", sobreNome, "| Tipo:", type(sobreNome)) -- string
print("Valor:", 100, "| Tipo:", type(100))             -- number
print("Valor:", true, "| Tipo:", type(true))           -- boolean
print("Valor:", nil, "| Tipo:", type(nil))             -- null/delete

local show = print
print("Valor:", show, "| Tipo:", type(show)) -- function

-- Exclusão de Variavel (Limpeza de Memória)
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

-- Relational Operators (Operadores Relacionais)
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

-- Logical Operators (Operadores Lógicos)
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

-- Control Structures (Controle de Estruturas)
-- do, if, while, repet, for
-- break e return

-- Local Variables and Blocks (Bloco local - do .. end)
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

-- Functions
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

-- Lexical Scoping (Escopo Léxico)
local objPerson = {
	nome = "Alexandre",
	getIdade = function(anoNasc)
		local anoAtual = 2026
		return anoAtual - anoNasc
	end
}

print("Lexical Scorping => Nome:", objPerson.nome, "| Idade:", objPerson.getIdade(1985))

-- More about Functions (Mais sobre Funções)
-- Função com Closure
local funcClosure = function(nomeTime, anoCampeonato)
	local ultAno = 2026 - anoCampeonato
	return function() -- Closure -> Função Anônima
		return "Time: " .. nomeTime .. " | Tempo do Título: " .. ultAno .. " ano(s)"
	end
end

local funcResClosure = funcClosure("Palmeiras", 2025) -- Passagem por Referência
print("Function with Closure =>", funcResClosure())

local funcClosureTwo = function(profileKey)
	if profileKey ~= "ADM" then
		return function() -- Closure -> Função Anônima
			return "Erro - Não Autorizado (" .. profileKey .. ")"
		end
	else
		return function() -- Closure -> Função Anônima
			return "Ok - Autorizado (" .. profileKey .. ")"
		end
	end
end

local funcResClosureTwo = funcClosureTwo("ADM") -- Passagem por Referência
print("Function with Closure => Log:", funcResClosureTwo())

-- Função Local
-- Formato Um
local funcLocalOne = function()
	print("Non-Global Functions => Formato Um")
end

funcLocalOne()

-- Formato Dois
local function funcLocalTwo()
	print("Non-Global Functions => Formato Dois")
end

funcLocalTwo()

-- Formato Três e Quatro (Like Javascript Object)
LocalFuncObj = {
	funcLocalThree = function()
		print("Non-Global Functions => Formato Objeto Um")
	end
}

LocalFuncObj.funcLocalThree()

LocalFuncObj.funcLocalFour = function()
	print("Non-Global Functions => Formato Objeto Dois")
end

LocalFuncObj.funcLocalFour()

-- Iterators and Closures (Iteradores)
local iterFactory = function(paramList)
	local idx = 0
	return function() -- Passagem por Referência
		idx = idx + 1
		if paramList[idx] ~= nil then
			return idx, paramList[idx]
		else
			return nil
		end
	end
end

-- COM "Generic for"
for index, value in iterFactory({ 100, 200 }) do
	print("Iterators and Closures (With Generic For) => My-Index: " .. index .. " | My-Value: " .. value)
end

-- SEM "Generic for"
local iterWhile = iterFactory({ 110, 120 })
while true do
	local idx, value = iterWhile()
	if idx ~= nil then
		print("Iterators and Closures (Without Generic For) => My-Index: " .. idx .. " | My-Value: " .. value)
	else
		break
	end
end

-- Stateless Iterators
local iterFuncA = function(paramListNow, posNow)
	posNow = posNow + 1
	if paramListNow[posNow] == nil then
		return nil
	else
		return posNow, paramListNow[posNow]
	end
end

local iterFuncAFactory = function(paramList)
	local pos = 0
	-- The iterator function, an invariant state, and a control variable.
	return iterFuncA, paramList, pos
end

for idx, value in iterFuncAFactory({ "A", "B", "C" }) do
	print("Iterators and Closures (Stateless) => My-Index: " .. idx .. " | My-Value: " .. value)
end

-- Compilation, Execution, and Errors
-- Functions: LOADSTRING and LOADFILE
CountLoad = 0
local myFuncString = loadstring("CountLoad = CountLoad + 10") -- Acesso somente as variaveis globais

for icount = 1, 6, 2 do
	myFuncString() -- Compilação e Execução
end
print("Compilation, Execution, and Error (Load's) => Somatório:", CountLoad)

-- The require Function
-- Carga baseada no diretório e/ou no arquivo (?;?.lua)
local reqOne = require("files/one") -- Internamente -> files/one;files/one.lua
print("Compilation, Execution, and Error (Require) => Msg:", reqOne.MyFunctionOne())

-- Errors
-- Error and Assert
if true == false then -- Somente para NÃO interromper a execução
	local getErro = false

	if getErro == true then
		-- Lançamento direto
		error("Compilation, Execution, and Error (Error) => Msg: Lançamento de Erro")
	else
		-- Verifica antes de lançar
		local msgAssert = "Compilation, Execution, and Error (Assert) => Msg: " ..
			"Lançamento de Erro Verificado"
		local resAssert = assert(1 == 2, msgAssert)
	end
end

-- Error Handling and Exceptions
-- Functions: ERROR and PCALL (protected call)
local pcallCheck = function(...)
	local nrParam = { ... }
	local nrSum = 0
	for idx, value in ipairs(nrParam) do
		nrSum = nrSum + tonumber(value) -- Lançamento interno do erro
	end
	return nrSum
end

local myFuncPcall = function()
	pcallCheck({ 10, 20, "C" })
end

local sttsPcall, msgPcall = pcall(myFuncPcall) -- Recepção do erro SEM interrupção do programa
if not sttsPcall then
	print("Compilation, Execution, and Error (PCall) => Msg:", msgPcall)
end

-- Coroutine
-- Coroutine Basics
-- States: Suspended, Running and Dead
local coroutineOne = coroutine.create(function()
	print("Coroutine (Basic) => Msg: Task One")
end)

print("Coroutine (Basic) => Execution:", coroutine.resume(coroutineOne)) -- Inicializa a corotina
print("Coroutine (Basic) => Status:", coroutine.status(coroutineOne))    -- Verifica o status

-- Coroutine with Field YIELD
-- Controle de execução
local coroutineTwo = coroutine.create(function()
	local myTasks = { "Task One", "Task Two" }
	for index, value in ipairs(myTasks) do
		print("Coroutine (Basic Two) => Msg:", value)
		coroutine.yield() -- Suspende a execução temporariamente
	end
end)

for coroIdx = 1, 3 do
	print("Coroutine (Basic Two) => Execution:", coroutine.resume(coroutineTwo))
	print("Coroutine (Basic Two) => Status:", coroutine.status(coroutineTwo))
end

-- Coroutine with Field YIELD (and parameters)
local coroutineThree = coroutine.create(function(myId)
	print("Coroutine (Basic Three) => MsgId:", myId)
	local resId = coroutine.yield() -- Suspende a execução temporariamente		
	print("Coroutine (Basic Three) => MsgId-Pos-Break:", resId)
end)

for coroId = 1, 3 do
	print("Coroutine (Basic Three) => Execution:", coroutine.resume(coroutineThree, coroId))
	print("Coroutine (Basic Three) => Status:", coroutine.status(coroutineThree))
end

-- Pipes and Filters
local sendLineCo = function(param)
	coroutine.yield(param) -- Suspende a execução temporariamente
end

local showLineCo = function(param)
	print("Coroutine (Pipes and Filters) =>", param)
end

local coRead = function(paramFile)
	return coroutine.create(function()
		for idx, vl in ipairs(paramFile) do
			sendLineCo("Read: " .. tostring(vl))
		end
	end)
end

local coWrite = function(paramFile)
	return coroutine.create(function()
		for idx, vl in ipairs(paramFile) do
			sendLineCo("Write: " .. tostring(vl))
		end
	end)
end

local coMaster = function(paramRead, paramWrite)
	return coroutine.create(function()
		local successRes = nil
		local yieldRes = nil
		local statusRes = nil
		repeat
			successRes, yieldRes = coroutine.resume(paramRead) -- Inicializa a corotina
			statusRes = coroutine.status(paramRead)
			if statusRes ~= "dead" then
				showLineCo(yieldRes)
			end

			successRes, yieldRes = coroutine.resume(paramWrite) -- Inicializa a corotina
			statusRes = coroutine.status(paramWrite)
			if statusRes ~= "dead" then
				showLineCo(yieldRes)
			end
		until successRes == false
	end)
end

local arrayCoValues = { 10, 20, 30 }
local tRead = coRead(arrayCoValues)
local tWrite = coWrite(arrayCoValues)
local tMaster = coMaster(tRead, tWrite)
coroutine.resume(tMaster) -- Inicializa a corotina

-- Coroutines as Iterators
local coIterator = function(paramList)
	local pos = 0
	local coIter = coroutine.create(function()
		repeat
			pos = pos + 1
			if paramList[pos] == nil then
				coroutine.yield()        -- Suspende a execução temporariamente
			else
				coroutine.yield(pos, paramList[pos]) -- Suspende a execução temporariamente
			end
		until false
	end)
	return function()
		local success, resParam1, resParam2 = coroutine.resume(coIter) -- Inicializa a corotina
		return resParam1, resParam2
	end
end

local arrayCoIterator = { "AA", "AB" }
for idx, value in coIterator(arrayCoIterator) do
	print("Coroutine (as Iterators) => Pos.:", idx, "| Valor:", value)
end

-- Coroutine.Wrap
-- Retorna a Função -> Function (Diferente do Create -> Thread)
-- NÂO possui Controle de Status
local coFuncWrap = coroutine.wrap(function(paramNum, paramTot)
	local sumNum = 0
	for idx, vl in ipairs(paramNum) do
		sumNum = sumNum + vl
		print("Coroutine (Wrap) => Total de Chamadas:", idx, "de", paramTot)
		coroutine.yield() -- Suspende a execução temporariamente
	end
	print("Total:", sumNum)
end)

local arrayCoIterWrap = { 50, 60, 75 }
local totCoIterWrap = 3
coFuncWrap(arrayCoIterWrap, totCoIterWrap) -- Inicializa a corotina
coFuncWrap()                               -- Continuação da execução

-- Data Structures
-- Matrices and Multi-Dimensional Arrays
local aMult = {}

for idxLine = 1, 3 do -- Linhas
	aMult[idxLine] = {}
	for idxCol = 1, 2 do -- Colunas	
		aMult[idxLine][idxCol] = idxLine * idxCol
	end
end

-- aMult = {{1,2},{2,4},{3,6}}
print("Data Structures (Multi-Dimensional Arrays) => Valor (Linha 3 - Coluna 2):", aMult[3][2])

-- Linked Lists
-- Ex.: Lista com Algoritmo de Pilha "Stack" - LIFO (Last In, First Out)
local aList = nil
local aListCount = 0

repeat
	aListCount = aListCount + 1

	local intList = {}
	intList.previous = aList
	intList.value = aListCount * 100
	aList = intList
until aListCount == 3

while aList do
	print("Data Structures (Linked Lists) => Item:", aList.value)
	aList = aList.previous
end

-- Queues and Double Queues
local aQueues = {}

function aQueues.new()
	return { length = 0 }
end

function aQueues.push(list, value)
	list.length = list.length + 1
	list[list.length] = value
end

function aQueues.list(list)
	for idx, vl in ipairs(list) do
		print("Data Structures (Queues and Double Queues) => Cód. Produto:", vl)
	end
end

local aListQueues = aQueues.new()
aQueues.push(aListQueues, "A-3CE") -- Passagem por Referência
aQueues.push(aListQueues, "A-4CD") -- Passagem por Referência
aQueues.list(aListQueues)

--[[
Onde parei..
https://www.lua.org/pil/11.5.html
]]
