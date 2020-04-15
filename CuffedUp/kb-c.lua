-- Created by @murfasa and t.willy https://forum.cfx.re/u/murfasa

-- Functions --
local function getEntity(player) -- function To Get Entity Player Is Aiming At
	local _, entity = GetPlayerTargetEntity(player)
	return entity
end

function GetPlayerFromPed(ped)
	for a = 0, 64 do
		if GetPlayerPed(a) == ped then
			return a
		end
	end
	return -1
end

local function drawNotification(text) -- draws a notification box
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-- Functions

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerId()
        local ped = GetPlayerPed(PlayerId())
        if IsPedInMeleeCombat(ped) then
            if IsControlJustReleased(1, 51) then

                local entity = getEntity(player)
                local playerEntity = GetPlayerFromPed(entity)
                local pedCoords = GetEntityCoords(ped)
                local susCoords = GetEntityCoords(entity)
                local dist = Vdist2(pedCoords.x, pedCoords.y, pedCoords.z, susCoords.x, susCoords.y, susCoords.z)

                if (entity ~= 0) and dist < 1.5 then
                    drawNotification('~o~[Cuff Script] ~g~Cuffing player!')
                    TriggerServerEvent('cu:togglecuffentity', GetPlayerServerId(playerEntity), GetPlayerServerId(player))
                else
                    drawNotification('~o~[Cuff Script] ~r~No player found! Try and get closer.')
                end

            end
        end
    end
end)

Citizen.CreateThread(function()
    local hu = false
    local hudict = 'missminuteman_1ig_2'
    local huanim = 'handsup_enter'

	RequestAnimDict(hudict)
	while not HasAnimDictLoaded(hudict) do
		Citizen.Wait(100)
	end
    
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 323) then --Start holding X
            if not hu then
                TaskPlayAnim(GetPlayerPed(-1), hudict, huanim, 8.0, 8.0, -1, 50, 0, 0, 0, 0)
                hu = true
            else
                hu = false
                ClearPedTasks(GetPlayerPed(-1))
                -- ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
    
end)

RegisterNetEvent('cu:cuffanim')
AddEventHandler('cu:cuffanim', function()
    local cuffdict = 'mp_arrest_paired'
    local cuffanim = 'cop_p2_back_right'

    ClearPedTasksImmediately(GetPlayerPed(-1))
    RequestAnimDict(cuffdict)
    while not HasAnimDictLoaded(cuffdict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), cuffdict, cuffanim, 8.0, -8, 3500, 16, 0, 0, 0, 0)
    Citizen.Wait(3500)
    ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('cu:uncuffanim')
AddEventHandler('cu:uncuffanim', function()
    local uncuffdict = 'mp_arresting'
    local uncuffanim = 'a_uncuff'

    ClearPedTasksImmediately(GetPlayerPed(-1))
	RequestAnimDict(uncuffdict)
	while not HasAnimDictLoaded(uncuffdict) do
		Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), uncuffdict, uncuffanim, 8.0, -8,-1, 2, 0, 0, 0, 0)
    Citizen.Wait(2200)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

print("CuffedUp created by Murtaza and Trevon")