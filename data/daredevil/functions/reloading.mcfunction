## reset rightclick detector
kill @e[tag=rightclick]
execute at @e[tag=dd] run summon villager ~ ~ ~ {Team:"rightclick",NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:0b,PersistenceRequired:1b,NoAI:1b,CareerLevel:1,Willing:0b,Tags:["rightclick"],CustomName:"{\"text\":\"rightclick\"}",ActiveEffects:[{Id:10b,Amplifier:100b,Duration:20000000,ShowParticles:0b},{Id:11b,Amplifier:100b,Duration:20000000,ShowParticles:0b},{Id:14b,Amplifier:1b,Duration:20000000,ShowParticles:0b},{Id:21b,Amplifier:100b,Duration:20000000,ShowParticles:0b}],Offers:{}}

## reset scoreboard
scoreboard players reset @e ddcrouch
tag @e[tag=!putonmask] add putonmask
tag @e[tag=putonmask] remove putonmask

##forceload
forceload add 0 0

##message
tellraw @a ["",{"text":"Reloaded!","underlined":true,"color":"green"},{"text":"   Daredevil Datapack","bold":true,"italic":true,"color":"dark_red"},{"text":" "},{"text":"by","color":"yellow"},{"text":" "},{"text":"F","color":"dark_aqua"},{"text":"lubberschnub","color":"dark_gray"}]
