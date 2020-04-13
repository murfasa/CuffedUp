-- Created by @murfasa and t.willy https://forum.cfx.re/u/murfasa
local dict = 'mp_arresting'
local animname = 'idle'
local dict2 = 'mp_arrest_paired'
local cuffed = false
local pID = 0
local ped = 0

RegisterNetEvent('cu:togglecuff')
AddEventHandler('cu:togglecuff', function(cop)
    pID = PlayerId()
    ped = GetPlayerPed(pID)

    if DoesEntityExist(ped) then
        if cuffed then
            TriggerServerEvent('cu:uncuffanim', cop)
            Citizen.Wait(2000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'uncuff', 0.6)
            ClearPedSecondaryTask(ped)
			SetEnableHandcuffs(ped, false)
			SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
			cuffed = false
        else
            ClearPedTasksImmediately(ped)
			RequestAnimDict(dict2)
			while not HasAnimDictLoaded(dict2) do
				Citizen.Wait(100)
            end
            TriggerServerEvent('cu:cuffanim', cop)
            Citizen.Wait(2000)
            TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'cuff', 0.6)
			SetEnableHandcuffs(ped, true)
			SetCurrentPedWeapon(ped, unarmed, true)
			cuffed = true
        end
    end
end)

Citizen.CreateThread(function()
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
    end
    while true do
        if cuffed then
            if not IsEntityPlayingAnim(ped, dict, animname, 3) then
                Citizen.Wait(3000)
                if cuffed then
                    TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
                end
            end
        end

        if cuffed then
            DisablePlayerFiring(pID, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
            if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
                DisableControlAction(0, 59, true)
            end
        end
        Citizen.Wait(0)
    end
end)

print("CuffedUp created by Murtaza and Trevon")