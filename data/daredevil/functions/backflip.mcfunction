## keep the player facing one direction
scoreboard players remove @e[scores={Flipping=1..}] Flipping 1
execute as @e[scores={Flipping=1..}] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[scores={Flipping=16..30}] at @s run tp @s ^ ^0.7 ^-0.3
execute as @e[scores={Flipping=3..15}] at @s run tp @s ^ ^-0.1 ^-0.3
execute as @e[scores={Flipping=1..}] at @s unless block ^ ^1.5 ^-0.2 minecraft:air unless block ^ ^1.5 ^-0.2 minecraft:cave_air unless block ^ ^1.5 ^-0.2 minecraft:grass unless block ^ ^1.5 ^-0.2 minecraft:tall_grass unless block ^ ^1.5 ^-0.2 minecraft:vine run scoreboard players set @s Flipping 0
execute as @e[scores={Flipping=..20}] at @s unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:grass unless block ~ ~-1 ~ minecraft:tall_grass unless block ~ ~-1 ~ minecraft:sunflower run scoreboard players set @s Flipping 0
effect give @e[scores={Flipping=1..}] minecraft:resistance 1 100 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=!minecraft:zombie,type=!minecraft:skeleton,type=!minecraft:zombified_piglin,type=!minecraft:husk,type=!minecraft:stray] minecraft:instant_damage 1 0 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=minecraft:zombie] minecraft:instant_health 1 0 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=minecraft:skeleton] minecraft:instant_health 1 0 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=minecraft:zombified_piglin] minecraft:instant_health 1 0 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=minecraft:husk] minecraft:instant_health 1 0 true
execute at @e[tag=dd,scores={Flipping=1..31}] run effect give @e[distance=..3,tag=!dd,type=minecraft:stray] minecraft:instant_health 1 0 true
execute at @e[scores={Flipping=29}] run playsound minecraft:entity.bat.takeoff master @a[distance=..5]
