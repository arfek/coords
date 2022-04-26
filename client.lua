local visibility = false

Citizen.CreateThread(function()
--[[TODO: Refazer com outra logica? acho improvavel.]]
    while true do
		local await = 250
		
		if visibility then
			await = 5

			local ped = playerPedId()
			local pedX, pedY, pedZ =  table.unpack( GetEntityCoords(ped) )

			local pedH = GetEntityHeading(ped)

			DrawCoordinates(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(formatAxis(pedX), formatAxis(pedY), formatAxis(pedZ), formatAxis(pedH)))
		end


		--[[ Isso causa lag pelo o que sei, não entendo muito sobre então decidi manter conforme os exemplos que busquei. ]]--
		--[[ EN: Known to cause lag. Not sure what to do here to avoid it. ]] --
		Citizen.Wait(await)

	end
end)


function DrawCoordinates(text)
	SetTextFont(7)
	SetTextColour(0, 122, 186, 255)
	SetTextScale(0.378, 0.378)
	SetTextCentre(false)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	SetTextWrap(0.0, 1.0)
	DrawText(0.50, 0.00)
end


-- [[Utils]] --

formatAxis = function(xyzh)
	if xyzh == nil then
		return "?"
	end

	return tonumber(string.format("%.2f", xyzh))
end


onoff = function()
	visibility = not visibility
end

RegisterCommand("cds", function()
    onoff()
end)