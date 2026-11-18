class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func player_layer() -> Layer:
	return map.layers.get(player.layer)
