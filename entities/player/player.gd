class_name Player

extends CharacterBody2D

var grid_position : Vector2i
var layer : int
var speed = 400.0

func get_layer() -> int:
	return self.layer

func get_grid_position() -> Vector2i:
	return self.grid_position

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed
	move_and_slide()
