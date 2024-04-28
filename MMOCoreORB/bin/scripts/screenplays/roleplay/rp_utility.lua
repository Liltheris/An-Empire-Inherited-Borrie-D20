function table.copy(t)
	local t2 = {};
	for k,v in pairs(t) do
		if type(v) == "table" then
			t2[k] = table.copy(v);
		else
			t2[k] = v;
		end
	end
	return t2;
end

RpUtil = {}

function RpUtil:rollSpam(roll, bonus)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..roll.." + "..bonus.." = "..roll+bonus..")\\#FFFFFF"
end

function RpUtil:rollSpamDC(roll, bonus, dc)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..rollString.." + "..bonus.." = "..roll+bonus.." vs DC: "..dc..")\\#FFFFFF"
end