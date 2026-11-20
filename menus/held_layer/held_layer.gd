class_name HeldLayer
extends Control

@onready var sub_viewport : SubViewport = $LayerView
@onready var texture : TextureRect = $Texture


@export var _layer : Layer

func set_layer(layer: Layer):
	_layer = layer

func _ready() -> void:
	if _layer != null:
		sub_viewport.add_child(_layer)
		sub_viewport.get_camera_2d().position = _layer.global_wall_position()
		sub_viewport.size.x = _layer.width() * 64
		sub_viewport.size.y = _layer.height() * 64


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
