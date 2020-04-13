-- Created by @murfasa and t.willy https://forum.cfx.re/u/murfasa

RegisterNetEvent('cu:togglecuffentity')
AddEventHandler('cu:togglecuffentity', function(player, cop)
    TriggerClientEvent('cu:togglecuff', tonumber(player), tonumber(cop))
end)

RegisterNetEvent('cu:cuffanim')
AddEventHandler('cu:cuffanim', function(cop)
    TriggerClientEvent('cu:cuffanim', cop)
end)

RegisterNetEvent('cu:uncuffanim')
AddEventHandler('cu:uncuffanim', function(cop)
    TriggerClientEvent('cu:uncuffanim', cop)
end)

print("CuffedUp created by Murtaza and Trevon")