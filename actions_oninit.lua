aura_env.dispatchCustomEvent = function(customEventName, payload)
    return function()
        WeakAuras.ScanEvents(customEventName, unpack(payload))
    end
end

aura_env.isStoneShatteringLeapCast = function(spellID)
    return spellID == 319941
end

aura_env.timedFrameGlow = function(unit, duration)
    return {
        show = true,
        changed = true,
        progressType = "timed",
        duration = duration,
        expirationTime = GetTime() + duration,
        unit = unit,
        autoHide = true
    }
end
