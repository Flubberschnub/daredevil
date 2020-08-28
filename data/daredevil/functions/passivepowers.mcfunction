## makes entities glow if close enough
#scoreboard players reset @e[tag=dd] ddcrouch
stopsound @a[tag=dd,scores={ddcrouch=1..}] ambient
stopsound @a[tag=dd,scores={ddcrouch=1..}] weather
stopsound @a[tag=dd,scores={ddcrouch=1..}] neutral
stopsound @a[tag=dd,scores={ddcrouch=1..}] record
stopsound @a[tag=dd,scores={ddcrouch=1..}] voice
execute at @e[tag=dd,scores={ddcrouch=1..}] run execute at @e[type=skeleton,distance=50,limit=1] run playsound minecraft:entity.skeleton.step master @a[tag=dd] ~ ~ ~ 50 1 1
execute at @e[tag=dd,scores={ddcrouch=1..}] run execute at @e[type=zombie,distance=50,limit=1] run playsound minecraft:entity.zombie.step master @a[tag=dd] ~ ~ ~ 50 1 1
execute at @e[tag=dd,scores={ddcrouch=1..}] run effect give @e[distance=..100,tag=!dd] minecraft:glowing 1 1 true
execute as @e[tag=dd] unless score @s ddcrouch matches 1.. run effect clear @s blindness
execute as @e[tag=dd,scores={ddcrouch=1..}] run effect give @s minecraft:blindness 10 0 true
execute at @e[tag=dd] run execute as @e[type=arrow,distance=..100] run data merge entity @s {Glowing:1b}
execute at @e[tag=dd] run execute as @e[type=arrow,distance=100..] run data merge entity @s {Glowing:0b}

## blindness but can see sporadically cuz of echolocation (headache causing!)
scoreboard players add @e[tag=dd] echotimer 1
effect give @e[tag=dd,tag=blind,scores={echotimer=13}] minecraft:night_vision 100 0 true
effect clear @e[tag=dd,tag=blind,scores={echotimer=15}]
scoreboard players set @e[tag=dd,scores={echotimer=15..}] echotimer 0
effect give @e[tag=dd,tag=blind,scores={echotimer=0}] minecraft:blindness 100 0 true
effect clear @e[tag=dd,tag=blind,scores={echotimer=13..}] minecraft:blindness
effect give @e[tag=dd,tag=!blind] night_vision 20 1 true

## speed and jump and strength and resistance
effect give @e[tag=dd] minecraft:speed 1 1 true
effect give @e[tag=dd] minecraft:jump_boost 1 1 true
effect give @e[tag=dd] minecraft:strength 1 0 true

## walljump
#execute at @e[tag=dd] unless block ~1 ~ ~ minecraft:air run function #daredevil:jump
#execute at @e[tag=dd] unless block ~-1 ~ ~ minecraft:air run function #daredevil:jump
#execute at @e[tag=dd] unless block ~ ~ ~1 minecraft:air run function #daredevil:jump
#execute at @e[tag=dd] unless block ~ ~ ~-1 minecraft:air run function #daredevil:jump
#scoreboard players add @e[tag=jumping,tag=dd,scores={jumptimer=1..}] jumptimer #1
#execute at @e[tag=jumping,tag=dd,scores={jumptimer=9..}] run fill ~-1 ~ ~-1 ~1 #~-2 ~1 minecraft:air replace barrier
#tag @e[tag=jumping,tag=dd,scores={jumptimer=10..}] remove jumping
#scoreboard players set @e[tag=dd,scores={jumptimer=11..}] jumptimer 0

## baton
function daredevil:throwbaton

## blocking
effect give @e[tag=dd,scores={Shield=1..}] minecraft:speed 1 10 true
scoreboard players set @e[scores={Shield=1..}] Shield 0

## put on mask
execute as @a[scores={blackmask=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{BlackMask:1}}}] run tag @s add putonmask
scoreboard players reset @e blackmask
execute as @a[tag=putonmask] unless entity @s[nbt={Inventory:[{Slot:103b}]}] run replaceitem entity @s weapon.mainhand air
execute as @a[tag=putonmask] unless entity @s[nbt={Inventory:[{Slot:103b}]}] run replaceitem entity @s armor.head minecraft:carrot_on_a_stick{display:{Name:"{\"text\":\"The Black Mask\",\"color\":\"black\",\"bold\":\"true\",\"italic\":\"true\"}"},HideFlags:63,BlackMask:1,Unbreakable:1b,Damage:2b} 1
tag @a[tag=putonmask] remove putonmask
