local bolt = require("bolt")
local texturedata = require("texturedata")

-- Gets the current percentage of the secondary bar
-- Used for smithing item heat, archaeology, etc.
-- Might not provide an accurate value for adrenaline
local secondarybarpercentage = nil
local function getsecondarybarpercentage()
    local MAX_DIFF = 56
    bolt.onrender2d(function (event)
        local xposes = {}
        for i = 1, event:vertexcount() do
            local ax, ay, aw, ah = event:vertexatlasdetails(i)

            if not event:texturecompare(ax, ay + 3, texturedata.interface.bars.secondarybar) then
                goto continue
            end

            xposes[#xposes + 1] = event:vertexxy(i)
            ::continue::
        end

        if next(xposes) ~= nil then
            local barrightposx = math.max(unpack(xposes))
            local barleftposx = math.min(unpack(xposes))
            local bardiff = barrightposx - barleftposx
            secondarybarpercentage = math.ceil((bardiff / MAX_DIFF) * 100)
        end
    end)
    return secondarybarpercentage
end


return {
    getsecondarybarpercentage = getsecondarybarpercentage
}