--[[
    HYPERION ELITE - FINAL MODULAR LOADER
]]

if _G.HyperionEliteLoaded then return end
_G.HyperionEliteLoaded = true

local function load(url)
    local success, result = pcall(function() return game:HttpGet(url) end)
    if success then
        local func, err = loadstring(result)
        if func then
            func()
            return true
        else
            warn("Loadstring error:", err)
        end
    else
        warn("HttpGet error:", result)
    end
    return false
end

-- 1. Load Core (UI Engine)
load("https://raw.githubusercontent.com/XHyperionSL/HyperionNameTags/refs/heads/main/HyperionElite/HyperionCore.lua")

-- 2. Load Reanim System
load("https://raw.githubusercontent.com/XHyperionSL/HyperionNameTags/refs/heads/main/HyperionElite/HyperionReanim.lua")

-- 3. Load All Tabs
load("https://raw.githubusercontent.com/XHyperionSL/HyperionNameTags/refs/heads/main/HyperionElite/HyperionTabs.lua")

print("[HyperionLoader] Loaded Sucessfully!")
