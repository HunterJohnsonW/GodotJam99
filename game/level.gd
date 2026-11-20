class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map

func _ready() -> void:
	for layer in map.layers:
		layer.clicked.connect(_try_pick_up)

func _physics_process(delta: float) -> void:
	pass

func player_layer() -> Layer:
	return map.layers.get(player.layer)

func _try_pick_up(layer: Layer) -> void:
	print(layer.layer)
	if !layer.click_area.overlaps_body(player) && layer == map.layers.get(map.layers.size() - 1):
		layer.visible = false	
