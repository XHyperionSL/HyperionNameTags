--[[
    Hyperion Elite Modular Loader
]]

if _G.HyperionEliteLoaded then
    warn("[HyperionLoader] Hyperion Elite is already loaded!")
    return
end

print("[HyperionLoader] Initializing modular architecture...")

-- 1. Load Core Framework
local coreUrl = "https://raw.githubusercontent.com/XHyperionSL/HyperionNameTags/refs/heads/main/HyperionElite/HyperionCore.lua"
local success, coreErr = pcall(function()
    loadstring(game:HttpGet(coreUrl))()
end)

if not success then
    warn("[HyperionLoader] Failed to load Core:", coreErr)
    return
end

-- Wait for the bridge to be populated
local _GE = nil
for i = 1, 100 do
    if _G._HYPERION_CORE then
        _GE = _G._HYPERION_CORE
        break
    end
    task.wait(0.1)
end

if not _GE then
    warn("[HyperionLoader] Core bridge initialization timeout!")
    return
end

-- 2. Load Features Module
local featuresUrl = "https://raw.githubusercontent.com/XHyperionSL/HyperionNameTags/refs/heads/main/HyperionElite/HyperionFeatures.lua"
local featSuccess, featErr = pcall(function()
    loadstring(game:HttpGet(featuresUrl))()
end)

if not featSuccess then
    _GE.UI.Notify("Loader Error", "Failed to load features module", 5, true)
    warn("[HyperionLoader] Failed to load Features:", featErr)
    return
end

-- 3. Finalize
_G.HyperionEliteLoaded = true
_GE.UI.Notify("Hyperion Elite", "Modular system loaded successfully!", 3)
print("[HyperionLoader] Modularization complete. Enjoy!")
