class_name Layer
extends Node2D

@onready var tile_map : TileMapLayer = $TileMapLayer

# tile array
# can_move() -> bool
# is_in(position: Vector2) -> bool
#
var moving = false

var layer : int

func _ready() -> void:
	pass


func get_pos_world(pos: Vector2i) -> Vector2:
	var local_pos = tile_map.map_to_local(pos)
	return to_global(local_pos)
