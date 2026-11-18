class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map

func _ready() -> void:
	for layer in map.layers:
		layer.clicked.emit(_try_pick_up)
	pass

func _physics_process(delta: float) -> void:
	pass

func player_layer() -> Layer:
	return map.layers.get(player.layer)

func _try_pick_up(layer: Layer) -> void:
	if player_layer().layer != layer.layer && layer.layer == 1:
		layer.visible = false	
