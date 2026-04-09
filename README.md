# Virusinjection
🧬 FiveM Virus Injection Script

A simple, standalone virus system for FiveM that lets players infect others with a syringe-style command.

No framework needed. Just drop it in and it works.

✨ Features
💉 Inject nearby players using /inject
🎲 Configurable infection chance (default: 60%)
🧪 3-stage infection system:
Stage 1 → vomiting + itching
Stage 2 → frequent sickness + fainting
Stage 3 → heavy effects, screen shake, blackout, death
🎭 Animations for both injector and target
⚡ Fully standalone (no ESX / QB / ox required)
🔧 Easy config
📦 Installation
Download or clone this repo

Put it in your resources folder:

resources/[local]/injecter

Add to your server.cfg:

ensure injecter
Restart your server
⚙️ Config

Located in config.lua

Config.InjectCommand = "inject"
Config.InjectDistance = 2.0
Config.InfectionChance = 60

Config.Stage1Time = 120
Config.Stage2Time = 180
Config.Stage3DeathTime = 120
🎮 Usage
Inject a player
/inject
Targets the closest player
Plays injection animation
Applies infection (based on chance)
Test on yourself
/testvirus
🧪 Infection System
Stage 1
Vomiting
Itching
Stage 2
Vomiting every minute
Itching
Fainting every 5 minutes
Stage 3
Screen shake
Heavy effects
Passing out
Death
📁 Structure
injecter/
│── fxmanifest.lua
│── config.lua
│── client.lua
│── server.lua
⚠️ Notes
Script is standalone
No database required
No dependencies
Works on any FiveM server
🔧 Ideas / Future Updates
💉 Syringe item instead of command
💊 Antidote / cure system
🧍 Infection spreading between players
🫀 Better medical animations
📊 UI / status effects
