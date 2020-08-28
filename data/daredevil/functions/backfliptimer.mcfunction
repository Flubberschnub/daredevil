## backflip timer
execute as @e[x_rotation=90,tag=dd] run scoreboard players set @s backfliptimer 20
scoreboard players remove @e[scores={backfliptimer=1..}] backfliptimer 1
execute as @e[x_rotation=-90,tag=dd,scores={backfliptimer=1..}] run scoreboard players set @s Flipping 30
#scoreboard players add @e[scores={Flipping=30}] Fatigue 5
