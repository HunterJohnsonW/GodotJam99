class_name Stack
extends Node2D

@onready var layer_container = $Layers

@onready var layers : Array[Layer] = []

@onready var collision_tile_set : TileSet = load("res://stages/tileset_tres/wall_tileset.tres")
var collision_tile_map : TileMapLayer

func _ready() -> void:
	var children = layer_container.get_children()
	layers.assign(children)
	layers.sort_custom(func(layer_1: Layer, layer_2: Layer):
		if layer_1.layer < layer_2.layer:
			return true
		else:
			return false)
	for layer in layers:
		layer.removed.connect(build_collision)
	build_collision(null)


func _process(delta: float) -> void:
	pass

# layer_index - layer value of the layer to remove
# returns: the Layer removed
func remove_layer(layer_index: int) -> Layer:
	var removed = layers.pop_at(layer_index) as Layer
	if removed != null:
		var i = 0
		for layer in layers:
			layer.layer = i
			i += 1
		removed.removed.emit(removed)
	return removed

func print_layer(layer: Layer) -> void:
	print("walls")
	for wall in layer.wall.get_used_cells():
		print(wall)
	print("floors")
	for floor in layer.floor.get_used_cells():
		print(floor)

func array_remove_dupes(array: Array) -> Array:
	var temp_dict := {}
	for element in array:
		temp_dict[element] = true
	return Array(temp_dict.keys(), TYPE_VECTOR2I, "", null)

func build_collision(_l: Layer) -> void:
	# todo: remove existing collision
	var new_walls : Array[Vector2i] = []
	for layer in layers:
		var wall_cells = layer.wall.get_used_cells()
		var floor_cells = layer.floor.get_used_cells()
		new_walls.append_array(wall_cells)
		new_walls = array_remove_dupes(new_walls)
		for floor_cell in floor_cells:
			var floor_overwrite_idx = new_walls.find(floor_cell)
			if floor_overwrite_idx != -1:
				new_walls.remove_at(floor_overwrite_idx)
	
	if collision_tile_map != null:
		remove_child(collision_tile_map)

	collision_tile_map = TileMapLayer.new()
	collision_tile_map.tile_set = collision_tile_set
	add_child(collision_tile_map)
	for wall in new_walls:
		collision_tile_map.set_cell(wall, 0, Vector2i(1, 6))
