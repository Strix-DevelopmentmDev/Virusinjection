Config = {}

-- chance target gets infected
Config.InfectionChance = 60

-- distance to inject nearest player
Config.InjectDistance = 2.0
Config.UseJobCheck = false
-- seconds until next stage
Config.Stage1Time = 20
Config.Stage2Time = 30
Config.Stage3DeathTime = 20

-- command
Config.InjectCommand = "inject"

-- if true, only allowed jobs can use /inject
Config.UseJobCheck = false

-- edit for your framework if needed
Config.AllowedJobs = {
    ["ambulance"] = true,
    ["doctor"] = true,
    ["ems"] = true
}