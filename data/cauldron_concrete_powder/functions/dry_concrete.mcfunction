
# Switch case
scoreboard players set #success cauldron_concrete_powder.dropped 0
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:white_concrete_powder"} run data modify entity @s Item.id set value "minecraft:white_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:orange_concrete_powder"} run data modify entity @s Item.id set value "minecraft:orange_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:magenta_concrete_powder"} run data modify entity @s Item.id set value "minecraft:magenta_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:light_blue_concrete_powder"} run data modify entity @s Item.id set value "minecraft:light_blue_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:yellow_concrete_powder"} run data modify entity @s Item.id set value "minecraft:yellow_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:lime_concrete_powder"} run data modify entity @s Item.id set value "minecraft:lime_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:pink_concrete_powder"} run data modify entity @s Item.id set value "minecraft:pink_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:gray_concrete_powder"} run data modify entity @s Item.id set value "minecraft:gray_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:light_gray_concrete_powder"} run data modify entity @s Item.id set value "minecraft:light_gray_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:cyan_concrete_powder"} run data modify entity @s Item.id set value "minecraft:cyan_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:purple_concrete_powder"} run data modify entity @s Item.id set value "minecraft:purple_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:blue_concrete_powder"} run data modify entity @s Item.id set value "minecraft:blue_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:brown_concrete_powder"} run data modify entity @s Item.id set value "minecraft:brown_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:green_concrete_powder"} run data modify entity @s Item.id set value "minecraft:green_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:red_concrete_powder"} run data modify entity @s Item.id set value "minecraft:red_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if data entity @s Item{id:"minecraft:black_concrete_powder"} run data modify entity @s Item.id set value "minecraft:black_concrete"

# If success, remove water
execute if score #success cauldron_concrete_powder.dropped matches 1 store result score #count cauldron_concrete_powder.dropped run data get entity @s Item.Count
execute if score #success cauldron_concrete_powder.dropped matches 1 if score #count cauldron_concrete_powder.dropped matches 16.. run function cauldron_concrete:remove_water

# Reset success and count
scoreboard players reset #success cauldron_concrete_powder.dropped
scoreboard players reset #count cauldron_concrete_powder.dropped

