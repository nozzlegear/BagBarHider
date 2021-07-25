local function PrintHelp()
    print("Usage:") 
    print("`/bags show` to show the bag bar.")
    print("`/bags hide` to hide the bag bar.")
end

local function HideBags()
    MicroButtonAndBagsBar:Hide()
end

local function ShowBags()
    MicroButtonAndBagsBar:Show()
end

local eventFrame = CreateFrame("Frame")
-- PLAYER_ENTERING_WORLD is fired when user logs in, reloads UI, or goes through a loading screen (zone change)
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function (self, event, isInitialLogin, isReloadingUi)
    HideBags()
end)

SLASH_BAGS1 = "/bags"
function SlashCmdList.BAGS(msg, editBox)
    -- Trim the string and convert it to lowercase
    msg = string.gsub(msg, "^%s*(.-)%s*$", "%1"):lower()

    if msg == "show" then
        ShowBags()
    elseif msg == "hide" then
        HideBags()
    else
        PrintHelp()
    end
end
