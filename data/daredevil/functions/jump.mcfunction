tag @e[tag=dd] add jumping
execute at @e[tag=dd] run fill ~ ~-1 ~ ~ ~-1 ~ minecraft:barrier replace air
scoreboard players set @e[tag=jumping,tag=dd] jumptimer 1