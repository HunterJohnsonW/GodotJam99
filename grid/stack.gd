class_name Stack
extends Node2D

@onready var layer_container = $Layers

@onready var layers : Array[Layer] = []

func _ready() -> void:
	var children = layer_container.get_children()
	layers.assign(children)


func _process(delta: float) -> void:
	pass

func move_to_top(layer_index: int) -> void:
	var to_top = layers.pop_at(layer_index) as Layer
	layers.push_front(to_top)
	var i = 0
	for layer in layers:
		layer.layer = i
		i += 1
