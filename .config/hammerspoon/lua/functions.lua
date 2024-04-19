function OpenApp(appName)
    return function()
        hs.application.launchOrFocus(appName)
    end
end
function DisableAll(keySet)
    for _, v in pairs(keySet) do v:disable() end
end
function EnableAll(keySet)
    for _, v in pairs(keySet) do v:enable() end
end
