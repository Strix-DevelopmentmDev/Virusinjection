🧬 VirusInjection

Standalone infection system for FiveM with staged effects, animations, and full progression to death.

✨ Features
💉 Inject nearby players using /inject
🎲 Configurable infection chance (default: 60%)
🧪 Advanced 3-stage infection system
Stage 1: nausea + itching
Stage 2: recurring sickness + fainting
Stage 3: severe effects, screen shake, blackout, death
🎭 Synced animations (injector & target)
⚡ Fully standalone (no ESX / QB / dependencies)
🔧 Simple and easy configuration
📦 Installation
# 1. Place resource
resources/[local]/injecter

# 2. Add to server.cfg
ensure injecter

Restart your server and you're good to go.

⚙️ Configuration

All settings are located in config.lua:

Config.InjectCommand = "inject"
Config.InjectDistance = 2.0
Config.InfectionChance = 60

Config.Stage1Time = 120
Config.Stage2Time = 180
Config.Stage3DeathTime = 120
🎮 Usage
Inject a Player
/inject
Targets the closest player
Plays injection animation
Applies infection based on chance
Self Test
/testvirus
🧪 Infection Stages
🟢 Stage 1
Vomiting
Itching
🟡 Stage 2
Vomiting every 60 seconds
Itching
Fainting every 5 minutes
🔴 Stage 3
Screen shake
Heavy visual effects
Passing out
Death
📁 Resource Structure
injecter/
├── fxmanifest.lua
├── config.lua
├── client.lua
└── server.lua
⚠️ Notes
Completely standalone
No database required
No external dependencies
Works on any FiveM server
🔧 Planned Improvements
💉 Syringe item instead of command
💊 Antidote / cure system
🧍 Infection spread system
🫀 Improved medical animations
📊 UI / status indicators  
