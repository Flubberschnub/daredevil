## arrow dodge
#execute at @e[tag=dd] run tp @e[tag=dd] ~ ~ ~ facing entity @e[type=arrow,distance=..6,nbt={inGround:0b},limit=1]

## catching arrow
tag @e[tag=dd,tag=!emptyhand] add emptyhand
tag @e[tag=emptyhand,nbt={SelectedItem:{}}] remove emptyhand
execute as @e[tag=emptyhand] at @s if entity @e[type=arrow,nbt={inGround:0b},distance=..3,limit=1] run scoreboard players set @s arrowcatch 2
execute at @e[tag=dd,tag=emptyhand,scores={arrowcatch=1..}] run kill @e[type=arrow,nbt={inGround:0b},distance=..3]
scoreboard players remove @e[scores={arrowcatch=0..}] arrowcatch 1
replaceitem entity @a[tag=emptyhand,scores={arrowcatch=1..}] weapon.mainhand minecraft:arrow 1

## arrow fatigue
scoreboard players add @e[scores={arrowcatch=1..}] Fatigue 1
