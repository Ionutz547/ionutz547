-- [[ CONFIGURARE GENERALA ]] --
local ScriptName = "Ionut Scripts" 
local Creator = "Ionut" 

-- [[ NOTIFICARE START ]] --
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = ScriptName,
    Text = "Se incarca scriptul de " .. Creator .. "...",
    Duration = 5
})

-- [[ LOGICA DE INCARCARE ]] --

if game.PlaceId == 76558904092080 then -- ID-ul pentru jocul The Forge
    -- Acest link va incarca fisierul the_forge.lua din repository-ul tau
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ionutz547/AxionScript/main/the_forge.lua"))()

elseif game.PlaceId == 2788229376 then -- ID pentru Da Hood (Exemplu)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ionutz547/AxionScript/main/script_dahood.lua"))()

elseif game.PlaceId == 155615604 then -- ID pentru Prison Life (Exemplu)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ionutz547/AxionScript/main/script_prison.lua"))()

else
    -- Daca joci altceva care nu e in lista de mai sus:
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Eroare",
        Text = "Jocul " .. game.Name .. " nu este suportat inca!",
        Duration = 10
    })
    warn("Joc nesuportat. ID detectat: " .. game.PlaceId)
end