class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map

var tile_size = 64
var inputs = {"up": Vector2i.UP, "down": Vector2i.DOWN, "left": Vector2i.LEFT, "right": Vector2i.RIGHT}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			player.grid_position += inputs[dir]
			player.position = player_layer().map_to_local(player.grid_position)

func player_layer() -> Layer:
	return map.layers.get(player.layer)
