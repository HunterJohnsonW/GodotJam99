class_name Stack
extends Node2D

@onready var layer_container = $Layers

@onready var layers : Array[Layer] = []

var collision_tile_set : TileSet = load("res://stages/tileset_tres/wall_tileset.tres")

func _ready() -> void:
	var children = layer_container.get_children()
	layers.assign(children)
	for layer in layers:
		layer.clicked.connect(build_collision)
		#layer.clicked.connect(print_layer)


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
	return removed

func print_layer(layer: Layer) -> void:
	print("walls")
	for wall in layer.wall.get_used_cells():
		print(wall)
	print("floors")
	for floor in layer.floor.get_used_cells():
		print(floor)


func build_collision(_l: Layer) -> void:
	# todo: remove existing collision
	var new_walls : Array[Vector2i] = []
	for i in range(layers.size() - 1, -1, -1):
		var layer = layers[i]
		var wall_cells = layer.wall.get_used_cells()
		var floor_cells = layer.floor.get_used_cells()
		new_walls.append_array(wall_cells)
		for floor_cell in floor_cells:
			var floor_overwrite_idx = new_walls.find(floor_cell)
			if floor_overwrite_idx != -1:
				new_walls.remove_at(floor_overwrite_idx)
	
	var new_wall_tilemap : TileMapLayer = TileMapLayer.new()
	new_wall_tilemap.tile_set = collision_tile_set
	add_child(new_wall_tilemap)
	new_walls.sort()
	for wall in new_walls:
		print(wall)
		new_wall_tilemap.set_cell(wall, 0, Vector2i(1, 6))
