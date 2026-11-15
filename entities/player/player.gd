class_name Player

extends CharacterBody2D

var grid_position : Vector2i
var layer : int

func get_layer() -> int:
	return self.layer

func get_grid_position() -> Vector2i:
	return self.grid_position
