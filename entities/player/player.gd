class_name Player

extends CharacterBody2D

var tile_size = 64
var inputs = {"up": Vector2.UP, "down": Vector2.DOWN, "left": Vector2.LEFT, "right": Vector2.RIGHT}

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			position += inputs[dir] * tile_size
