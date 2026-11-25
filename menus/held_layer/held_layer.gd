class_name HeldLayer
extends SubViewportContainer

@onready var sub_viewport : SubViewport = $SubViewport
@onready var camera_2d: Camera2D = $SubViewport/Camera2D
@export var _layer : Layer

func set_layer(layer: Layer):
	_layer = layer

func get_layer() -> Layer:
	return _layer

func _ready() -> void:
	if _layer != null:
		sub_viewport.add_child(_layer)
		camera_2d.position = get_layer_center(_layer.wall)

func get_layer_center(layer: TileMapLayer) -> Vector2:
	var used_rect := layer.get_used_rect()
	if used_rect.size == Vector2i.ZERO or layer.tile_set == null:
		return Vector2.ZERO
	
	var tile_size := Vector2(layer.tile_set.tile_size)
	var top_left := Vector2(used_rect.position) * tile_size
	var total_size := Vector2(used_rect.size) * tile_size
	print("Center :", top_left + (total_size * 0.5))
	return top_left + (total_size * 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
