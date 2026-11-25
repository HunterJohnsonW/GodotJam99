class_name LayerBag
extends VBoxContainer

var layers: Array[Layer] = []

var held_layer_scene : PackedScene = load("res://menus/held_layer/held_layer.tscn")

func _set_layers(l: Array[Layer]):
	layers = l

func add_to_bag(layer: Layer) -> void:
	layers.append(layer)
	var held_layer : HeldLayer = held_layer_scene.instantiate()
	held_layer.set_layer(layer)
	add_child(held_layer)

func remove_from_bag(layer: Layer) -> void:
	for child in layer.get_children():
		if child is HeldLayer:
			var held_layer = child as HeldLayer
			if held_layer.get_layer() == layer:
				remove_child(held_layer)

	layers.erase(layer)
