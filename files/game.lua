local g = {}

local addTeam = function(...)
	local teams = { ... }
	for _, value in ipairs(teams) do
		local team = {}
		team.name = value
		table.insert(g, team)
	end
end

local getScore = function()
	for _, value in ipairs(g) do
		value.score = math.random(0, 10)
	end
end

local setPosition = function()
	table.sort(g, function(vlOne, vlTwo)
		-- Ordem decrescente
		if vlOne.score < vlTwo.score then
			return false
		else
			return true
		end
	end)
end

local startChampionship = function()
	getScore()
	setPosition()
end

local showResults = function()
	for idx, value in ipairs(g) do
		local msg = string.format("Team (%d): %s | Score: %d", idx, value.name, value.score)
		print("Packages (Packages and Files) => Position Game:", msg)
	end
end

local game = {
	add = addTeam,
	start = startChampionship,
	show = showResults
}

return game
