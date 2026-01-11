---@diagnostic disable: undefined-global
-- Missed Opportunity by SEVNCE
-- Counterattack on critical misses with weapons and cantrips
--
-- BLADE CANTRIP SUPPORT:
-- - Booming Blade and Green-Flame Blade ARE supported!
-- - Uses Target_BoomingBlade_ClassSpell and Target_GreenFlameBlade_ClassSpell
-- - Thanks to community research for discovering the correct spell IDs

local passive = "Passive_MissedOpportunity"

-- Extended melee attack list with modern BG3 abilities
local melee_attacks = {
    "Target_ShockingGrasp",
    "Shout_Thunderclap",
    "Target_Tentacles_MindFlayer",
    "Target_WYR_Tentacles_MindFlayer_NoDamageNoResist",
    "Target_MF_Tentacles_MindFlayer",
    "Target_Tentacles_MindFlayer_NoStun",
    "Target_Tentacle_DisplacerBeast",
    "Target_Slam_VampireSquid_Tentacle",
    "Target_Grapple_NetherTentacle",
    "Target_StickyPaws_Bear",
    "Target_Claws_Bear_Brown", 
    "Target_Claws_Bear_Black_Summon", 
    "Target_Claws_Bear_Cave",
    "Target_Claws_Bear_Polar",
    "Target_Claws_Cat",
    "Target_Claws_Ettercap",
    "Target_Claws_Harpy",
    "Target_Claws_GiantBadger",
    "Target_Claws_GiantBadger_Wildshape",
    "Target_Claws_GreenHag",
    "Target_Claws_Imp",
    "Target_Claws_Imp_Summon",
    "Target_Claws_IntellectDevourer",
    "Target_Claws_IntellectDevourer_Weakened",
    "Target_Claws_Mephit_Mud",
    "Target_Claws_Mephit_Magma",
    "Target_Claws_Owlbear",
    "Target_Claws_Owlbear_WildShape",
    "Target_Claws_Owlbear_Cub",
    "Target_Claws_Quasit",
    "Target_Claws_Scarecrow",
    "Target_Claws_StoneCursed",
    "Target_Claws_Werewolf",
    "Target_CripplingPinch_Crab_Summon",
    "Target_Hook",
    "Target_Claws_Quasit_Summon",
    "Target_Generic_Goblin",
    "Target_Generic_Hobgoblin",
    "Target_BarbedVine_DarkVine",
    "Target_Claws_Apostle",
    "Target_Claws_CrawlingClaw",
    "Target_Claws_Drider",
    "Target_Claws_Ghoul_Flying",
    "Target_Claws_Ghoul",
    "Target_Claws_IceMephit",
    "Target_Claws_MudMephit_ConjureMinorElmental",
    "Target_Claws_IntellectDevourer_Colony",
    "Target_Claws_Meazel",
    "Target_Claws_Meenlock",
    "Target_Claws_Meenlock_Variation",
    "Target_Claws_Sahuagin",
    "Target_Claws_Shadow",
    "Target_Claws_Surgeon",
    "Target_Claws_TollCollector",
    "Target_Claws_Vampire",
    "Target_ClawsOfTheGrave_Necromite",
    "Target_LifeDrain_Wraith",
    "Target_RipandShred_SaberTooth_Tiger",
    "Target_Claws_AnimateDead_Ghoul",
    "Target_Claws_WakeTheDead_Ghoul",
    "Target_Claws_WakeTheDead_UndeadThrall_Ghoul",
    "Target_Claws_Ghast",
    "Target_Claws",
    "Target_Bite_MothersLoathing",
    "Target_UND_Spectator_Bite",
    "Target_Bite_Spectator",
    "Target_LOW_IronThrone_Mizora_Spiderlings_Attack",
    "Target_LOW_HouseOfGrief_SpiderBite_Vic",
    "Target_LOW_HouseOfGrief_SpiderBite",
    "Target_LOW_HouseOfGrief_WolfBite_Vic",
    "Target_LOW_HouseOfGrief_WolfBite",
    "Target_Bite_GiantSpider",
    "Target_Bite_GiantSpider_Summon",
    "Target_Bite_GiantSpider_Wildshape",
    "Target_Bite_PhaseSpider",
    "Target_Bite_PhaseSpider_Queen",
    "Target_Bite_SwordSpider",
    "Target_Bite_TinySpider",
    "Target_Bite_TinySpider_Underdark",
    "Target_Bite_TinySpider_Familiar",
    "Target_Bite_TinySpider_Phase",
    "Target_LOW_Astarion_VampireAscendant",
    "Target_VampireBite_Astarion",
    "Target_LOW_Vampire_Bite_NoAstarion",
    "Target_LOW_VampireBite",
    "Target_Bite_Vampire",
    "Target_Bite_Wolf",
    "Target_WYR_Dribbles_Dog_Bite",
    "Target_LOW_Bite_Dog_Ghost",
    "Target_Bite_Dog_Ghost",
    "Target_Bite_Dog",
    "Target_Bite_Bear_Brown",
    "Target_Bite_Bear_Black_Summon",
    "Target_Bite_Bulette",
    "Target_Bite_GiantBadger",
    "Target_Bite_GiantBadger_Summon",
    "Target_Bite_Mimic",
    "Target_Bite_Gnoll",
    "Target_Bite_Gnoll_Fang",
    "Target_Bite_Hyena",
    "Target_Bite_Rat",
    "Target_Bite_Rat_Summon",
    "Target_Bite_Wolf_Summon",
    "Target_Bite_Wolf_Dire",
    "Target_Bite_Wolf_Dire_Wildshape",
    "Target_Bite_Wolf_Dire_NPC",
    "Target_InfectiousBite_Wolf",
    "Target_Sting_Imp",
    "Target_Bite",
    "Target_Bufotoxin_Frog_Summon",
    "Target_Gore_Minotaur",
    "Target_Gore_DeepRothe",
    "Target_Gore_DeepRothe_NPC",
    "Target_UnarmedAttack"
}

local cantrips = {
    "Projectile_EldritchBlast",
    "Projectile_NightPiercer",
    "Projectile_LightPiercer",
    "Target_SacredFlame",
    "Target_TollTheDead",
    "Target_ViciousMockery",
    "Projectile_FireBolt",
    "Target_ChillTouch",
    "Projectile_RayOfFrost",
    "Target_Frostbite",
    "Target_MindSliver",
    "Projectile_PoisonSpray",
    "Shout_ProduceFlame",
    "Projectile_AcidSplash",
    "Target_LightningLure",
    "Target_ThornWhip",
    "Projectile_SappingCurse",
    "Target_Starfall",
    "Target_BoneChillExtra"
}

-- Helper function to check if defender can retaliate
local function CanRetaliate(defender)
    -- Cannot retaliate if dead
    if Osi.IsDead(defender) == 1 then
        return false
    end
    
    -- Cannot retaliate if blinded
    if Osi.HasActiveStatus(defender, "SG_Blinded") == 1 then
        return false
    end
    
    return true
end

-- Helper function to check if defender can cast cantrips
local function CanCastCantrip(defender)
    -- Cannot cast if silenced
    if Osi.HasActiveStatus(defender, "SG_Silenced") == 1 then
        return false
    end
    
    return true
end

-- Main critical miss handler - Changed to MISSED_OPPORTUNITY
Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(attacker, status, defender, _)
    if status == "MISSED_OPPORTUNITY" then
        -- Verify both entities are alive and attacker has the missed opportunity status
        if Osi.IsDead(attacker) == 0 and Osi.HasActiveStatus(attacker, "MISSED_OPPORTUNITY") == 1 then
            
            -- Only the target (defender) can retaliate
            if not CanRetaliate(defender) then
                Osi.RemoveStatus(attacker, status, defender)
                return
            end
            
            local distance = Osi.GetDistanceTo(defender, attacker)
            
            -- Melee range retaliation (within 2 meters)
            if distance <= 2 then
                local hasAttacked = false
                
                -- Check for Booming Blade and Green-Flame Blade FIRST (if not silenced)
                if CanCastCantrip(defender) then
                    -- Try the _ClassSpell variants first (these are what characters actually learn)
                    if Osi.HasSpell(defender, "Target_BoomingBlade_ClassSpell") == 1 then
                        Osi.UseSpell(defender, "Target_BoomingBlade_ClassSpell", attacker)
                        hasAttacked = true
                    elseif Osi.HasSpell(defender, "Target_BoomingBlade") == 1 then
                        Osi.UseSpell(defender, "Target_BoomingBlade", attacker)
                        hasAttacked = true
                    elseif Osi.HasSpell(defender, "Target_GreenFlameBlade_ClassSpell") == 1 then
                        Osi.UseSpell(defender, "Target_GreenFlameBlade_ClassSpell", attacker)
                        hasAttacked = true
                    elseif Osi.HasSpell(defender, "Target_GreenFlameBlade") == 1 then
                        Osi.UseSpell(defender, "Target_GreenFlameBlade", attacker)
                        hasAttacked = true
                    end
                end
                
                -- Check for melee weapon attacks
                if not hasAttacked and Osi.HasMeleeWeaponEquipped(defender, "Any") == 1 then
                    -- Standard melee weapon attacks
                    if Osi.HasMeleeWeaponEquipped(defender, "Mainhand") == 1 then
                        Osi.UseSpell(defender, "Target_MainHandAttack", attacker)
                        hasAttacked = true
                    end
                    if Osi.HasMeleeWeaponEquipped(defender, "Offhand") == 1 then
                        Osi.UseSpell(defender, "Target_OffHandAttack", attacker)
                        hasAttacked = true
                    end
                end
                
                -- If no weapon attack, check for natural melee attacks (claws, bites, etc.)
                if not hasAttacked then
                    for _, spell in ipairs(melee_attacks) do
                        if Osi.HasSpell(defender, spell) == 1 then
                            Osi.UseSpell(defender, spell, attacker)
                            hasAttacked = true
                            break
                        end
                    end
                end
                
                -- Final fallback: unarmed attack for humanoids with no weapons/natural attacks
                if not hasAttacked then
                    Osi.UseSpell(defender, "Target_UnarmedAttack", attacker)
                end
            
            -- Ranged retaliation (2-18 meters)
            elseif distance > 2 and distance <= 18 then
                if Osi.HasRangedWeaponEquipped(defender, "Any") == 1 then
                    -- Use ranged weapon attacks
                    if Osi.HasRangedWeaponEquipped(defender, "Mainhand") == 1 then
                        Osi.UseSpell(defender, "Projectile_MainHandAttack", attacker)
                    end
                    if Osi.HasRangedWeaponEquipped(defender, "Offhand") == 1 then
                        Osi.UseSpell(defender, "Projectile_OffHandAttack", attacker)
                    end
                else
                    -- Only use cantrips if not silenced
                    if CanCastCantrip(defender) then
                        -- Check for cantrips with proper range handling
                        for _, spell in ipairs(cantrips) do
                            if Osi.HasSpell(defender, spell) == 1 then
                                local canCast = false
                                
                                -- Special range checks for specific cantrips
                                if spell == "Projectile_PoisonSpray" and distance <= 3 then
                                    canCast = true
                                elseif spell == "Target_LightningLure" and distance <= 5 then
                                    canCast = true
                                elseif spell == "Target_ThornWhip" and distance <= 9 then
                                    canCast = true
                                elseif spell == "Shout_ProduceFlame" then
                                    -- Convert to projectile version
                                    Osi.UseSpell(defender, "Projectile_ProduceFlame_Hurl", attacker)
                                    canCast = false -- Already cast
                                elseif spell ~= "Projectile_PoisonSpray" and spell ~= "Target_LightningLure" and spell ~= "Target_ThornWhip" and spell ~= "Shout_ProduceFlame" then
                                    -- Standard long-range cantrips
                                    canCast = true
                                end
                                
                                if canCast then
                                    Osi.UseSpell(defender, spell, attacker)
                                end
                                
                                break
                            end
                        end
                    end
                end
            end
            
            -- Clean up the status after retaliation
            Osi.RemoveStatus(attacker, status, defender)
        end
    end
end)

-- Apply passive to all combatants when combat starts
Ext.Osiris.RegisterListener("CombatStarted", 1, "after", function(combat)
    for _, row in pairs(Osi.DB_Is_InCombat:Get(nil, combat)) do
        local combatant = row[1]
        if combatant ~= nil and Osi.IsDead(combatant) == 0 then
            Osi.AddPassive(combatant, passive)
        end
    end
    
    -- Also apply to entities that join combat later
    Ext.Osiris.RegisterListener("EnteredCombat", 2, "after", function(combatant, combat_id)
        if combatant ~= nil and Osi.IsDead(combatant) == 0 then
            Osi.AddPassive(combatant, passive)
        end
    end)
end)

-- Remove passive when combat ends
Ext.Osiris.RegisterListener("CombatEnded", 1, "after", function(combat)
    for _, row in pairs(Osi.DB_Is_InCombat:Get(nil, combat)) do
        local combatant = row[1]
        if combatant ~= nil then
            Osi.RemovePassive(combatant, passive)
        end
    end
end)