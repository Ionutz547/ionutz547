repeat wait() until game:IsLoaded()

-- [[ CONFIGURARE ]] --
local ScriptName = "Ionut Scripts"
local Creator = "Ionut"

-- Identificare Executor
local name, version = identifyexecutor()
print("Executor detectat:", name, "Versiune:", version)

-- Tabel cu link-urile tale de pe GitHub (folosim formatul tau nou)
local PlaceIds = {
    [76558904092080] = "https://raw.githubusercontent.com/Ionutz547/AxionScript/main/the_forge.lua",
    [2788229376] = "https://raw.githubusercontent.com/Ionutz547/AxionScript/main/script_dahood.lua",
    [155615604] = "https://raw.githubusercontent.com/Ionutz547/AxionScript/main/script_prison.lua",
}

local currentPlaceId = game.PlaceId

-- Notificare de pornire
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = ScriptName,
    Text = "Se verifica compatibilitatea pentru " .. Creator .. "...",
    Duration = 5
})

-- Verificare daca jocul are script in lista
if PlaceIds[currentPlaceId] then
    print("Loading script pentru PlaceID: " .. currentPlaceId)
    
    -- Incarcare sigura a scriptului (nu da crash daca link-ul e gresit)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(PlaceIds[currentPlaceId]))()
    end)
    
    if success then
        print("✓ " .. ScriptName .. " incarcat cu succes!")
    else
        warn("✗ Eroare la incarcarea codului: " .. tostring(result))
    end
else
    -- Daca jocul nu e in lista
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Eroare",
        Text = "Joc nesuportat! ID: " .. currentPlaceId,
        Duration = 10
    })
    warn("✗ Nu a fost gasit un script pentru ID-ul: " .. currentPlaceId)
end