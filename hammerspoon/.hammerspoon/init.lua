-- HANDLE SCROLLING WITH MOUSE BUTTON PRESSED

local scrollMouseButtons = {
    [3] = true,
    [4] = true,
}
local dragged = false

overrideOtherMouseDown = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
    -- print(hs.eventtap.event.properties['mouseEventButtonNumber'])
    local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])

    if scrollMouseButtons[mouseButton] then
        dragged = false
        return true
    end
end)

overrideOtherMouseUp = hs.eventtap.new({ hs.eventtap.event.types.otherMouseUp }, function(e)
    -- print(hs.eventtap.event.properties['mouseEventButtonNumber'])
    local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])

    if not dragged then
        -- print('not dragged')

        -- recreate original key press
        overrideOtherMouseDown:stop()
        overrideOtherMouseUp:stop()
        hs.eventtap.otherClick(hs.mouse.getAbsolutePosition(), 0, mouseButton)
        overrideOtherMouseDown:start()
        overrideOtherMouseUp:start()
        return true
    end
end)

local oldmousepos = {}
local scrollmult = 2    -- negative multiplier for traditional scrollwheel, positive for "natural"

dragOtherToScroll = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDragged }, function(e)
    local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
    -- print ("pressed mouse " .. mouseButton)
    if scrollMouseButtons[mouseButton] then
        -- print("scroll");
        dragged = true
        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    else
        return false, {}
    end
end)

overrideOtherMouseDown:start()
overrideOtherMouseUp:start()
dragOtherToScroll:start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
