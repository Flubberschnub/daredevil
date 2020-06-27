## teleport villager
tp @e[tag=rightclick] 0 100 0
tp @e[tag=rightclick] @a[tag=dd,limit=1,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}},scores={ddcrouch=1..}]
execute if entity @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}},scores={ddcrouch=1..}] run tag @e[tag=rightclick] add inuse

effect clear @e[tag=rightclick] glowing

## offhand
tag @a[tag=offhand] remove offhand
tag @a[tag=!offhand,nbt={Inventory:[{Slot:-106b}]}] add offhand
## reset ddcrouch
scoreboard players remove @e[scores={ddcrouch=1..}] ddcrouch 1

## test for rightclick
execute as @e[scores={RightClick=1..}] run function daredevil:batonthrow

## scoreboard stuff
scoreboard players remove @e[scores={RightClick=1..}] RightClick 1
scoreboard players remove @e[scores={batonhit=1..}] batonhit 1
tag @e[scores={batonhit=1..}] add batonhit
tag @e[scores={batonhit=..0}] remove batonhit

## movement of baton

    ## continuously face closest entity (tracking)
execute as @e[tag=thrownbaton,scores={throwing=..50}] at @s run tp @s ~ ~ ~ facing entity @e[tag=!dd,tag=!thrownbaton,tag=!rightclick,tag=!batonhit,type=!armor_stand,type=!minecraft:item,limit=1,type=!minecraft:arrow,type=!minecraft:experience_orb,distance=..3] feet

    ## when thrown, remove from hand
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=thrownbaton,scores={throwing=1}] run replaceitem entity @s weapon.mainhand air

    ## bounce off blocks
execute as @e[tag=thrownbaton,scores={throwing=3..}] at @s unless block ~ ~1 ~ #minecraft:batonblocks run scoreboard players set @s throwing 51
execute at @e[tag=thrownbaton,tag=!grapple,scores={throwing=51}] run playsound minecraft:batonclang master @a[distance=..20] ~ ~ ~ 1 1.5 1
execute as @e[tag=thrownbaton] at @s if block ~ ~1 ~ minecraft:glass run setblock ~ ~1 ~ minecraft:air destroy
execute as @e[tag=thrownbaton] at @s if block ~ ~1 ~ minecraft:glass_pane run setblock ~ ~1 ~ minecraft:air destroy

    ## give item back when caught
execute as @e[tag=dd,tag=emptyhand] at @s if entity @e[tag=thrownbaton,distance=..1] run replaceitem entity @s weapon.mainhand minecraft:shield{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}",Lore:["Billy club isn't a cool enough name."]},HideFlags:63,Unbreakable:1b,Damage:7,Enchantments:[{id:"minecraft:sharpness",lvl:10},{id:"minecraft:knockback",lvl:1},{id:"minecraft:looting",lvl:3}]}
execute as @e[tag=thrownbaton] at @s if entity @e[tag=dd,distance=..1,tag=emptyhand] run kill @s

    ## tp forward
execute as @e[tag=thrownbaton,tag=!grapple] at @s run tp @s ^ ^ ^1.5

    ## tp return to thrower
execute as @e[tag=thrownbaton,scores={throwing=51..}] at @s run tp @s ~ ~ ~ facing entity @e[tag=dd,limit=1] feet

    ## scoreboard timer
scoreboard players add @e[tag=thrownbaton] throwing 1

## damage entities, scores with batonhit, remove glow
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[type=!zombie,type=!skeleton,type=!zombie_villager,type=!drowned,type=!husk,type=!stray,type=!zombified_piglin,distance=..1,tag=!dd] minecraft:instant_damage 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=zombie] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=skeleton] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=zombie_villager] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=husk] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=stray] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=zombified_piglin] minecraft:instant_health 1 0 true
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run effect give @e[distance=..1,tag=!dd,type=drowned] minecraft:instant_health 1 0 true
kill @e[tag=batondamage]
#execute at @e[tag=thrownbaton] run execute at @e[distance=..1,tag=!dd,tag=!thrownbaton] run summon arrow ~ ~2.1 ~ {Glowing:0b,CustomNameVisible:0b,pickup:0b,player:0b,life:1199,damage:10d,Motion:[0.0,-1.0,0.0],Tags:["batondamage"]}
execute at @e[tag=thrownbaton] positioned ~ ~ ~ run scoreboard players set @e[distance=..0.5,tag=!dd,tag=!rightclick,tag=!thrownbaton] batonhit 5
tag @e[tag=batonhit] remove batonhit
tag @e[scores={batonhit=1..}] add batonhit
scoreboard players remove @e[scores={batonhit=1..}] batonhit 1
effect clear @e[tag=thrownbaton] minecraft:glowing

    ## kill any extra batons
#execute as @e[tag=thrownbaton] if score @s throwing < @e[tag=thrownbaton,limit=1] throwing run kill @s
#execute if entity @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}},Inventory:[{id:"minecraft:shield",Slot:-106b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"}}}]}] run kill @e[tag=thrownbaton,scores={throwing=5..}]

    ## grapple if other baton is in mainhand
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=thrownbaton] run tp @s ~ ~ ~ facing entity @e[tag=grapple,limit=1,scores={throwing=5..},distance=2..]
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=grapple,scores={throwing=5..},distance=2..] if block ^ ^1.5 ^1 air run tp @s ^ ^ ^0.4
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=grapple,scores={throwing=5..},distance=2..] if block ^ ^1.5 ^1 cave_air run tp @s ^ ^ ^0.4
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=grapple,scores={throwing=5..},distance=2..] if block ^ ^1.5 ^1 #minecraft:water run tp @s ^ ^ ^0.4
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=grapple,scores={throwing=5..},distance=2..] if block ^ ^1.5 ^1 grass run tp @s ^ ^ ^0.4
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] at @s if entity @e[tag=grapple,scores={throwing=5..},distance=2..] if block ^ ^1.5 ^1 tall_grass run tp @s ^ ^ ^0.4
execute as @e[tag=dd,nbt={SelectedItem:{id:"minecraft:shield",Count:1b,tag:{display:{Name:"{\"text\":\"Baton\",\"color\":\"dark_red\",\"bold\":\"true\"}"},Unbreakable:1b}}}] if entity @e[tag=thrownbaton] run tag @e[tag=thrownbaton,tag=latched,scores={throwing=5..}] add grapple
execute as @e[tag=dd,tag=emptyhand] if entity @e[tag=grapple] run tag @e[tag=grapple] remove grapple
effect clear @e[tag=grapplin] minecraft:levitation
tag @e[tag=grapplin] remove grapplin
execute as @e[tag=grapple] run tag @e[tag=dd,distance=1.5..] add grapplin
execute as @e[tag=grapple] run effect give @e[tag=dd,distance=1.5..,tag=grapplin] minecraft:levitation 1 0 true

    ## only works if its near a block
execute as @e[tag=thrownbaton] at @s unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:water unless block ~ ~ ~ minecraft:grass unless block ~ ~ ~ minecraft:tall_grass run tag @s add latched
execute as @e[tag=thrownbaton] at @s if block ~ ~ ~ minecraft:air run tag @s remove latched
execute as @e[tag=thrownbaton] at @s if block ~ ~ ~ minecraft:cave_air run tag @s remove latched
execute as @e[tag=thrownbaton] at @s if block ~ ~ ~ minecraft:water run tag @s remove latched
execute as @e[tag=thrownbaton] at @s if block ~ ~ ~ minecraft:grass run tag @s remove latched
execute as @e[tag=thrownbaton] at @s if block ~ ~ ~ minecraft:tall_grass run tag @s remove latched
execute at @e[tag=dd] if entity @e[tag=grapple] run playsound minecraft:grapple master @a[distance=..10] ~ ~ ~ 1 1.5 1
