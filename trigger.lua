function (allstates, event, unit, _, spellID)
    if (unit) then
        local unitTarget = unit .. "target"

        if (event == "UNIT_TARGET" and unit and UnitExists(unit)) then
            local _, _, _, _, _, _, _, _, castSpellID = UnitCastingInfo(unit)

            if (aura_env.isStoneShatteringLeapCast(castSpellID)) then
                allstates[unitTarget] = aura_env.timedFrameGlow(unitTarget, 5)
                return true
            end
        elseif (event == "TARGET_TANK") then
            allstates[unitTarget] = aura_env.timedFrameGlow(unitTarget, 4.5)
            return true
        elseif (event == "UNIT_SPELLCAST_START" and aura_env.isStoneShatteringLeapCast(spellID)) then
            C_Timer.After(0.5, aura_env.dispatchCustomEvent("TARGET_TANK", {unit}))
        end
    end
end
