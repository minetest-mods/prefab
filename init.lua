--This is a mod by DanDuncombe that adds pre-fabricated concrete stuff to Minetest
--It is CC-By-Sa for everything.
print("Prefab mod loading....")
dofile(minetest.get_modpath("prefab").."/crafting.lua")
print("Prefab Crafting loaded!")
dofile(minetest.get_modpath("prefab").."/other.lua")
print("Prefab Other loaded!")
print("Prefab Loaded!")

local creative = minetest.settings:get_bool("creative_mode")

local damage = tonumber(minetest.settings:get("prefab.electric_fence_damage")) or 30
if creative then damage = 0 end

minetest.register_node("prefab:concrete", {
	drawtype = "normal",
	description = "Block of Prefab Concrete",
	paramtype = "light",
	tiles = {"prefab_concrete.png"},
	is_ground_content = false,
	groups = {cracky=2},
})

if core.global_exists("stairsplus") then
	stairsplus:register_all("prefab", "concrete", "prefab:concrete", {
		groups = {
			not_in_creative_inventory = 1,
			cracky = 3
		},
		tiles = {"prefab_concrete.png"},
		description = "Block of Prefab Concrete"
	})
else
	stairs.register_stair_and_slab("concrete", "prefab:concrete", {
		cracky = 3
	}, {"prefab_concrete.png"}, "Block of Prefab Concrete Stair", "Block of Prefab Concrete Slab")
end

if core.global_exists("technic_cnc") then
	technic_cnc.register_all("prefab:concrete", {
		cracky = 2,
		not_in_creative_inventory = 1
	}, {"prefab_concrete.png"}, "Block of Prefab Concrete")
end

minetest.register_node("prefab:concrete_with_grass", {
	description = "Prefab Concrete with Grass",
	paramtype = "light",
	tiles = {
		"default_grass.png",
		"prefab_concrete.png",
		"prefab_concrete_grass.png"
	},
	is_ground_content = false,
	drop = "prefab:concrete", -- like dirt with grass
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_wall", {
	description = "Prefab Concrete Wall Section",
	drawtype = "nodebox",
	tiles = {
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete_wall.png",
		"prefab_concrete_wall.png",
		"prefab_concrete_wall.png",
		"prefab_concrete_wall.png"
	},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.437500,0.500000,0.500000,0.437500},
			{-0.437500,-0.500000,-0.500000,0.437500,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_stair", {
	description = "Prefab Concrete Stair",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.000000,0.500000},
			{-0.500000,-0.500000,0.000000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_slab", {
	description = "Prefab Concrete Slab",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.000000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_stair_inverted", {
	description = "Prefab Concrete Stair (inverted)",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.000000,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.062500,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_stair",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_slab_inverted", {
	description = "Prefab Concrete Slab (inverted)",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.000000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_slab",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_slit", {
	description = "Prefab Horizontal Concrete Slit",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.000000,0.500000},
			{-0.500000,0.187500,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_window", {
	description = "Prefab Concrete Framed Window",
	drawtype = "nodebox",
	tiles = {
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete_window.png",
		"prefab_concrete_window.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.250000,0.500000},
			{-0.500000,0.250000,-0.500000,0.500000,0.500000,0.500000},
			{0.250000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,-0.250000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.000000,0.500000,0.500000,0.000000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_ladder", {
	drawtype = "signlike",
	description = "Prefab Concrete Ladder",
	tiles = {"prefab_concrete_ladder.png"},
	inventory_image = "prefab_concrete_ladder.png",
	wield_image = "prefab_concrete_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_fence", {
	description = "Prefab Concrete Fence",
	drawtype = "fencelike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	tiles = {"prefab_concrete.png"},
	is_ground_content = false,
	groups = {cracky=2},
})

doors.register_door("prefab:concrete_door", {
	description = "Concrete Door",
	inventory_image = "prefab_concrete_door_inv.png",
	groups = {cracky=2,door=1},
	tiles = {"prefab_concrete_door.png"},
	only_placer_can_open = true,
})

minetest.register_node("prefab:concrete_cylinder", {
	description = "Prefab Concrete Cylinder",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
			{-0.5,-0.500000,0.375000,0.500000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,-0.375000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,-0.375000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_bollard", {
	description = "Prefab Concrete Bollard",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.312500,-0.500000,-0.312500,0.312500,-0.312500,0.312500},
			{-0.250000,-0.500000,-0.250000,0.250000,-0.250000,0.250000},
			{-0.187500,-0.500000,-0.187500,0.187500,0.062500,0.187500},
			{-0.250000,0.062500,-0.250000,0.250000,0.125000,0.250000},
			{-0.312500,0.125000,-0.312500,0.312500,0.250000,0.312500},
			{-0.250000,0.250000,-0.250000,0.250000,0.312500,0.250000},
			{-0.187500,0.312500,-0.187500,0.187500,0.375000,0.187500},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.350000,-0.500000,-0.350000,0.350000,0.400000,0.350000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_bench", {
	description = "Prefab Concrete Bench",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125000,-0.500000,-0.062500,0.125000,0.062500,0.062500},
			{-0.500000,0.062500,-0.312500,0.500000,0.187500,0.312500},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.350000,0.500000,0.300000,0.350000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_railing", {
	description = "Prefab Concrete Railing",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{0.062500,-0.500000,0.062500,-0.062500,0.187500,-0.062500},
			{-0.500000,0.187500,-0.062500,0.500000,0.312500,0.062500},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_railing_corner", {
	description = "Prefab Concrete Railing Corner",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{0.062500,-0.500000,0.062500,-0.062500,0.187500,-0.062500},
			{-0.500000,0.187500,-0.062500,0.062500,0.312500,0.062500},
			{-0.062500,0.187500,-0.500000,0.062500,0.312500,0.062500},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_railing",
	groups = {cracky=2},
})

minetest.register_node("prefab:electric_fence", {
	description = "Electric Fence",
	tiles = {"prefab_electric_fence.png"},
	sunlight_propagates = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	damage_per_second = damage,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.500000,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.500000,-0.125000,0.062500},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:electric_fence_corner", {
	description = "Electric Fence Corner",
	tiles = {
		"prefab_electric_fence_corner_top.png",
		"prefab_electric_fence_corner_top.png",
		"prefab_electric_fence_corner_side1.png",
		"prefab_electric_fence_corner_side2.png",
		"prefab_electric_fence_corner_side1.png",
		"prefab_electric_fence_corner_side2.png"
	},
	sunlight_propagates = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	damage_per_second = damage,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.062500,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.062500,-0.125000,0.062500},
			{-0.062500,0.062500,-0.062500,0.062500,0.187500,0.500000},
			{-0.062500,-0.250000,-0.062500,0.062500,-0.125000,0.500000},
			{-0.125000,-0.500000,-0.125000,0.125000,0.500000,0.125000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:electric_fence_end", {
	description = "Electric Fence End",
	drawtype = "nodebox",
	tiles = {
		"prefab_electric_fence_end1.png",
		"prefab_electric_fence_end1.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_electric_fence_end2.png",
		"prefab_electric_fence_end1.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.500000,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.500000,-0.125000,0.062500},
			{-0.500000,-0.500000,-0.250000,-0.375000,0.500000,0.250000},
			{-0.375000,-0.437500,-0.250000,-0.250000,0.375000,0.250000},
			{0.250000,-0.312500,-0.125000,0.375000,0.250000,0.125000},
			{0.000000,-0.312500,-0.125000,0.125000,0.250000,0.125000},
		},
	},
	is_ground_content = false,
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_catwalk",{
	description = "Prefab Concrete Catwalk",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375000,0.500000},
			{-0.500000,-0.500000,-0.062500,-0.437500,0.500000,0.062500},
			{0.443299,-0.500000,-0.062500,0.500000,0.500000,0.062500},
			{0.443299,0.448454,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,0.448454,-0.500000,-0.437500,0.500000,0.500000},
		},
	},
	groups = {cracky=2},
})
