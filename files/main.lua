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
local reqOne = require("files/one") -- Separador (/) ou (.) -> Internamente: files/one;files/one.lua
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
	for _, value in ipairs(nrParam) do
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
	for _, value in ipairs(myTasks) do
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
		for _, vl in ipairs(paramFile) do
			sendLineCo("Read: " .. tostring(vl))
		end
	end)
end

local coWrite = function(paramFile)
	return coroutine.create(function()
		for _, vl in ipairs(paramFile) do
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
		local _, resParam1, resParam2 = coroutine.resume(coIter) -- Inicializa a corotina
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
	for _, vl in ipairs(list) do
		print("Data Structures (Queues and Double Queues) => Cód. Produto:", vl)
	end
end

local aListQueues = aQueues.new()
aQueues.push(aListQueues, "A-3CE") -- Passagem por Referência
aQueues.push(aListQueues, "A-4CD") -- Passagem por Referência
aQueues.list(aListQueues)

-- String Buffers
-- Biblioteca Table -> Manipulação de Array
-- Operador (#)     -> Total de Elementos no Array
local strBuffersOrigin = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F"
}
local strBuffersCopy = {}

-- Inversão
local strBuffers = {}
strBuffers.revert = function(paramArray)
	for idx = 1, #paramArray, 1 do        -- (#) -> Total de Elementos no Array
		local linePos = (#paramArray + 1) - idx -- (#) -> Total de Elementos no Array

		if linePos <= idx then break end

		local tmpLine = paramArray[linePos]
		paramArray[linePos] = paramArray[idx]
		paramArray[idx] = tmpLine
	end
end

-- Movimentação
strBuffers.move = function(arraySource, arrayTarget)
	for idx = #arraySource, 1, -1 do -- (#) -> Total de Elementos no Array
		-- Remoção
		local lineArraySource = table.remove(arraySource, idx)

		-- Inserção
		table.insert(arrayTarget, lineArraySource)
	end
end

-- Exibição
strBuffers.show = function(paramArray)
	print("Data Structures (String Buffers) =>",
		string.format("Tot.Reg.: %d | Final: %s", #paramArray, table.concat(paramArray)))
end

strBuffers.revert(strBuffersOrigin)
strBuffers.move(strBuffersOrigin, strBuffersCopy)
strBuffers.show(strBuffersOrigin)
strBuffers.show(strBuffersCopy)

-- Data Files and Persistence
local people = {}       -- Recepção das linhas
function Person(person) -- Função recursiva de mesmo nome na estrutura do arquivo
	if person.firstName then
		table.insert(people, person)
		print("Data Files and Persistence (Reading) => Total Inserido: " .. #people)
	end
end

-- Leitura do arquivo
dofile("files/data.csv")
for _, value in pairs(people) do
	print("Data Files and Persistence (Showing) => Nome Completo:", value.firstName, value.lastName)
end

-- Metatables and Metamethods
-- Methods: SETMETATABLE and GETMETATABLE
local myMeta = {}
print("Metatables and Metamethods (Get and Set) => Metatable:", getmetatable(myMeta))

local firstMeta = {}
setmetatable(firstMeta, myMeta)
print("Metatables and Metamethods (Get and Set) => Metatable:", getmetatable(firstMeta))

-- Arithmetic Metamethods
local metaNumbers = {}

function metaNumbers.factory(param)
	local metaNum = {}
	for idx, value in ipairs(param) do
		metaNum[idx] = value
	end
	setmetatable(metaNum, metaNumbers)
	print("Metatables and Metamethods (Arithmetic) => Source", metaNum, "| Link", getmetatable(metaNum))
	return metaNum
end

-- Configuração do comportamento nas operações
-- __add (for add)
-- __mul (for multiply)
-- __sub (for subtraction)
-- __div (for division)
-- __unm (for negation)
-- __pow (for exponentiation)
-- __concat (for concatenation)
function metaNumbers.__add(paramOne, paramTwo)
	local res = {}

	if getmetatable(paramOne) == metaNumbers then -- Validação do Metatable
		for _, value in ipairs(paramOne) do
			table.insert(res, value)
		end
	end

	if getmetatable(paramTwo) == metaNumbers then -- Validação do Metatable
		for _, value in ipairs(paramTwo) do
			table.insert(res, value)
		end
	end

	table.sort(res, function(v1, v2)
		if v1 < v2 then
			return true
		else
			return false
		end
	end)
	return res
end

function metaNumbers.show(param)
	local res = table.concat(param, ",");
	res = "{" .. res .. "}"
	print("Metatables and Metamethods (Arithmetic) => Reg.:", res)
end

local metaPar = metaNumbers.factory({ 0, 2, 4, 6, 8 })
local metaImpar = metaNumbers.factory({ 1, 3, 5, 7, 9 })
local metaResOne = metaPar + metaImpar
metaNumbers.show(metaResOne)

local metaNoMeta = { 11, 12, 13 }
local metaResTwo = metaPar + metaNoMeta
metaNumbers.show(metaResTwo)

-- Relational Metamethods
-- Configuração do comportamento nas operações
-- __eq (equality)
-- __lt (less than)
-- __le (less or equal)
function metaNumbers.__eq(paramOne, paramTwo)
	if not (#paramOne == #paramTwo) then
		return false
	end
	for idx, vl in pairs(paramOne) do
		if not (vl == paramTwo[idx]) then
			return false
		end
	end
	return true
end

local metaCompOne = metaNumbers.factory({ 1, 3, 5, 7, 11 });
local metaCompTwo = metaNumbers.factory({ 1, 3, 5, 7, 11 });
local metaCompThree = { 1, 3, 5, 7, 11 };

-- A metamethod only is selected when both objects being compared have the same type and
-- the same metamethod for the selected operation.
print("Metatables and Metamethods (Relational) => Compare One vs Two:", metaCompOne == metaCompTwo)
print("Metatables and Metamethods (Relational) => Compare Two vs Three:", metaCompTwo == metaCompThree)

-- Table-Access Metamethods
-- The __index Metamethod
metaNumbers.prototype = { isDecimals = true, isLengthFixe = false }

function metaNumbers.__index(paramTable, paramKey)
	return paramKey .. ": " .. tostring(metaNumbers.prototype[paramKey])
end

local metaTableOne = metaNumbers.factory({ 10, 20, 30 })
print("Metatables and Metamethods (Table-Access) => Get. Default: {",
	metaTableOne.isDecimals, "}")

print("Metatables and Metamethods (Table-Access) => Get. Default: {",
	metaTableOne.isLengthFixe, "}")

-- The __newindex Metamethod
local metaTableTwo = {}
function metaNumbers.__newindex(paramTable, paramKey, paramValue)
	table.insert(metaTableTwo, paramValue)
end

metaTableOne[#metaTableOne + 1] = 40
metaTableOne[#metaTableOne + 1] = 50

for idx, value in ipairs(metaTableTwo) do
	print("Metatables and Metamethods (Table-Access) => Insert: { index[" .. tostring(idx) .. "]:",
		value, "}")
end

-- Tables with Default Values
local metaTableDef = {}
function metaTableDef.factory(paramTable)
	return setmetatable(paramTable, metaTableDef)
end

function metaTableDef.setDefault(paramDef)
	metaTableDef.__def = paramDef
end

function metaTableDef.__index(paramTable, paramKey)
	return metaTableDef.__def
end

metaTableDef.setDefault("Z")
local metaTableNullOne = metaTableDef.factory({ "A", nil, "C" })
local metaTableNullConc = {}
for idx = 1, 5, 1 do
	metaTableNullConc[idx] = metaTableNullOne[idx]
end

print("Metatables and Metamethods (Table-Access) => Default (nil): {" ..
	table.concat(metaTableNullConc, ",") .. "}")

-- Tracking Table Accesses and Read-Only Table (Proxy)
local metaTableProxyModel = {}

local metaTableProxy = {
	__index = function(paramTable, paramKey)
		return paramTable[metaTableProxyModel][paramKey]
	end,

	__newindex = function(paramTable, paramKey, paramValue)
		-- Verifica se é editável
		if paramTable._edit then
			paramTable[metaTableProxyModel][paramKey] = paramValue
		else
			error("Tabela em modo de leitura (gravação NÃO permitida).", 2)
		end
	end
}

local getTableProxy = function(paramEdit)
	-- Retorno do proxy
	local tableProxy = {}
	tableProxy._edit = paramEdit
	tableProxy[metaTableProxyModel] = {}
	return setmetatable(tableProxy, metaTableProxy)
end

local metaTableEdit = true
local metaTableProxyOne = getTableProxy(metaTableEdit)
local metaTableProxyTwo = getTableProxy(metaTableEdit)

metaTableProxyOne[3] = "Manaus"
metaTableProxyTwo[3] = "Recife"

print("Metatables and Metamethods (Table-Access) => Proxying: Key:",
	3, "| Reg.:", metaTableProxyOne[3])

print("Metatables and Metamethods (Table-Access) => Proxying: Key:",
	3, "| Reg.:", metaTableProxyTwo[3])

-- The Environment
-- Accessing Global Variables with Dynamic Names (_G)
Employer = {}
Employer.Name = "Juan"
Employer.Position = "Manager"

local glNamesEmp = ""
for key, value in pairs(_G) do
	if key == "Employer" then
		for keyEmp, valueEmp in pairs(value) do
			glNamesEmp = keyEmp .. ": " .. valueEmp
			print("The Environment (Global Variables with Dynamic Names) => Employer (Manual):", glNamesEmp)
		end
	end
end

-- Declaring Global Variables
-- RAWSET and RAWGET (Set and get _G, without invoking any metamethod)
rawset(Employer, "Salary", 15470.95)

-- Similar: _G["Employer"]["Salary"]
print("The Environment (Declaring Global Variables) => Employer (Function): Salary:",
	rawget(Employer, "Salary"))

-- Packages
-- The Basic Approach
local g = {}
PkgGame = g

function g.add(teamOne, teamTwo)
	g.teamOne = {}
	g.teamTwo = {}
	g.teamOne.name = teamOne
	g.teamTwo.name = teamTwo
end

function g.start()
	g.teamOne.score = math.random(0, 10)
	g.teamTwo.score = math.random(0, 10)
end

function g.show()
	local msg = string.format('%s (%d) vs %s (%d)',
		g.teamOne.name, g.teamOne.score,
		g.teamTwo.name, g.teamTwo.score)
	print("Packages (The Basic Approach) => Final Game:", msg)
end

PkgGame.add("Palmeiras", "América")
PkgGame.start()
PkgGame.show()

-- Privacy (Reescrita do código acima)
local g2 = {}
PkgGameTwo = nil

local addTeam = function(teamOne, teamTwo)
	g2.teamOne = {}
	g2.teamTwo = {}
	g2.teamOne.name = teamOne
	g2.teamTwo.name = teamTwo
end

local startGame = function()
	g2.teamOne.score = math.random(0, 10)
	g2.teamTwo.score = math.random(0, 10)
end

local showResults = function()
	local msg = string.format('%s (%d) vs %s (%d)',
		g2.teamOne.name, g2.teamOne.score,
		g2.teamTwo.name, g2.teamTwo.score)
	print("Packages (Privacy) => Semifinal Game:", msg)
end

PkgGameTwo = {
	add = addTeam,
	start = startGame,
	show = showResults
}

PkgGameTwo.add("Coritiba", "Avaí")
PkgGameTwo.start()
PkgGameTwo.show()

-- Packages and Files (require)
local exPkgGame = require("files.game") -- Separador (/) ou (.) -> Internamente: files/game;files/game.lua
exPkgGame.add("Remo", "Bragantino", "Mirassol")
exPkgGame.start()
exPkgGame.show()

-- Object-Oriented Programming
-- Método/função com (:) -> Passa o objeto de origem (self) de forma oculta,
-- ou seja, vísivel somente dentro do método/função.
Home = {
	bedrooms = 0,
	setBedrooms = function(self, numRooms) -- Explícito (self)
		self.bedrooms = numRooms
	end
}

function Home:getBedrooms() -- Implicito (self)
	return "Bedrooms: " .. self.bedrooms
end

local townHouse = Home
townHouse:setBedrooms(3)
print("OOP in Lua (Method) =>", townHouse:getBedrooms())

local countryHouse = Home
countryHouse:setBedrooms(4)
print("OOP in Lua (Method) =>", countryHouse:getBedrooms())

-- Classes
Driver = {
	idLicenca = "",
	getIdLicenca = function(self)
		return self.idLicenca
	end,
	setIdLicenca = function(self, idLicenca)
		self.idLicenca = "A" .. idLicenca
	end,
	new = function(self)
		self.__index = self     -- Link para si mesmo
		return setmetatable({}, self) -- Novo objeto com link para si mesmo
	end
}

local oMotorBoy = Driver:new()
oMotorBoy:setIdLicenca(9876)

local oBusDriver = Driver:new()
oBusDriver:setIdLicenca(1234)

print("OOP in Lua (Classes) => ID Licença:", oMotorBoy:getIdLicenca())
print("OOP in Lua (Classes) => ID Licença:", oBusDriver:getIdLicenca())

-- Inheritance
-- Main Class
Vehicle = {
	idVehicle = nil
}

function Vehicle:new(paramRef)
	local ref = paramRef or {}
	self.idVehicle = "VH" .. math.random(100, 200)
	self.__index = self         -- Link para si mesmo
	return setmetatable(ref, self) -- Novo objeto com link para si mesmo
end

function Vehicle:getId()
	return self.idVehicle
end

-- Inherited Class
Car = Vehicle:new()

function Car:getSeats()
	return self.seats
end

function Car.factory(seats)
	local refCar = { seats = seats or 5 }
	return Car:new(refCar)
end

local oCar = Car.factory()
print("OOP in Lua (Inheritance) => ID Car (Main):", oCar:getId())
print("OOP in Lua (Inheritance) => Seats Car (Inherited):", oCar:getSeats())

local oCar2 = Car.factory(6)
print("OOP in Lua (Inheritance) => ID Car (Main):", oCar2:getId())
print("OOP in Lua (Inheritance) => Seats Car (Inherited):", oCar2:getSeats())

-- Multiple Inheritance
Person = {
	setNome = function(self, paramNome)
		self.nome = paramNome
	end,
	getNome = function(self)
		return self.nome
	end
}

Citizen = {
	setIdRG = function(self, paramIdRG)
		self.idRG = paramIdRG
	end,
	getIdRG = function(self)
		return self.idRG
	end
}

local getParentMethod = function(key)
	local parents = { Person, Citizen }
	for _, parentValue in ipairs(parents) do
		if parentValue[key] then
			return parentValue[key] -- Método da classe superior
		end
	end
end

Doctor = {} -- Person and Citizen

function Doctor.factory()
	local refDoctor = {
		setAtuacao = function(self, paramAtuacao)
			self.atuacao = paramAtuacao
		end,
		getAtuacao = function(self)
			return self.atuacao
		end
	}

	local refSuper = {
		__index = function(_, key)
			return getParentMethod(key)
		end
	}

	return setmetatable(refDoctor, refSuper) -- Link para a classe superior
end

local oDoctor = Doctor.factory()
oDoctor:setNome("Gilvan Souza")
oDoctor:setIdRG(1475)

print("OOP in Lua (Multiple Inheritance) => Nome (Person):", oDoctor:getNome())
print("OOP in Lua (Multiple Inheritance) => RG (Citizen):", oDoctor:getIdRG())

-- Privacy
BankAccount = {}

function BankAccount.factory(nome)
	local hideFields = { nome = nome, saldo = 0 } -- Campos privados

	local refAccount = {}
	refAccount.__index = refAccount

	function refAccount:addSaldo(paramValor)
		hideFields.saldo = hideFields.saldo + paramValor
	end

	function refAccount:subSaldo(paramValor)
		hideFields.saldo = hideFields.saldo - paramValor
	end

	function refAccount:getSaldo()
		return "Correntista: " .. hideFields.nome .. " | Saldo: " .. hideFields.saldo
	end

	return setmetatable({}, refAccount) -- Link para si mesmo
end

local accountOne = BankAccount.factory("Janaina")
accountOne:addSaldo(450)
accountOne:addSaldo(365)

local accountTwo = BankAccount.factory("Uiara")
accountTwo:addSaldo(465)
accountTwo:subSaldo(230)

print("OOP in Lua (Privacy) =>", accountOne:getSaldo())
print("OOP in Lua (Privacy) =>", accountTwo:getSaldo())

-- Weak Tables
local weakOne = {}
local weakTwo = {}
weakTwo.__mode = "k" -- 'k' -> Key; 'v' -> Value; 'kv' -> Key/Value
setmetatable(weakOne, weakTwo)

local weakKey = {} -- SEMPRE um Objeto
weakOne[weakKey] = 10

weakKey = {} -- SEMPRE um Objeto
weakOne[weakKey] = 20

weakKey = {} -- SEMPRE um Objeto
weakOne[weakKey] = 30

local showWeak = function(param)
	for _, value in pairs(weakOne) do
		print("Weak Tables (Overview) =>", param, value)
	end
end

showWeak("Antes do Garbage:")

-- Execução forçada do "Garbage Collection"
-- Registros sem referência ativa serão deletados
collectgarbage()
showWeak("Depois do Garbage:")

-- Memoize Functions
local weakResult = {}
setmetatable(weakResult, { __mode = "v" }) -- 'k' -> Key; 'v' -> Value; 'kv' -> Key/Value

local weakMemo = function(paramTable)
	for _, value in pairs(paramTable) do
		if weakResult[value] then
			print("Weak Tables (Memoize Functions) => Recuperação (Key):", value)
			return weakResult[value]
		else
			print("Weak Tables (Memoize Functions) => Inserção (Key):", value)
			weakResult[value] = paramTable
			return weakResult[value]
		end
	end
end

local weakMemoValue = { value = "A10" } -- SEMPRE um Objeto
weakMemo(weakMemoValue)

weakMemoValue = { value = "A25" } -- SEMPRE um Objeto
weakMemo(weakMemoValue)

-- Execução forçada do "Garbage Collection"
-- Registros sem referência ativa serão deletados
collectgarbage()

weakMemoValue = { value = "A10" } -- SEMPRE um Objeto
weakMemo(weakMemoValue)

-- Object Attributes + Revisiting Tables with Default Values
local weakDefaultsAttrib = {}
setmetatable(weakDefaultsAttrib, { __mode = "k" }) -- 'k' -> Key; 'v' -> Value; 'kv' -> Key/Value

local weakDefaultsModel = {
	__index = function(_, key)
		print("Weak Tables (Object Attributes) => { __INDEX } (Key):", key)
		return weakDefaultsAttrib[key]
	end,
	__newindex = function(_, key, value)
		print("Weak Tables (Object Attributes) => { __NEWINDEX } (Key):", key, "| (Value):", value)
		weakDefaultsAttrib[key] = value
	end
}

local weakObject = {}
setmetatable(weakObject, weakDefaultsModel)

local weakObjectKey = {} -- SEMPRE um Objeto
weakObject[weakObjectKey] = 5

weakObjectKey = {} -- SEMPRE um Objeto
weakObject[weakObjectKey] = 10

local showWeakObjects = function(paramGarbage)
	print("Weak Tables (Object Attributes) => Garbage Collection (Executado?):", paramGarbage)

	-- Execução forçada do "Garbage Collection"
	-- Registros sem referência ativa serão deletados
	if paramGarbage then collectgarbage() end

	for key in pairs(weakDefaultsAttrib) do
		assert(weakObject[key])
	end
end

-- SEM Garbage Collection
showWeakObjects(false)

-- COM Garbage Collection
showWeakObjects(true)
