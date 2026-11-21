class_name LayerBag
extends Control

var layers: Array[Layer] = []

var held_layer_scene : PackedScene = load("res://menus/held_layer/held_layer.tscn")

func _set_layers(l: Array[Layer]):
	layers = l
	_build_bag()

func _build_bag():
	for child in get_children():
		child.queue_free()

	for layer in layers:
		var held_layer : HeldLayer = held_layer_scene.instantiate()
		held_layer.set_layer(layer)
		add_child(held_layer)

func add_to_bag(layer: Layer) -> void:
	layers.append(layer)
	_build_bag()

func remove_from_bag(layer: Layer) -> void:
	layers.erase(layer)
	_build_bag()
