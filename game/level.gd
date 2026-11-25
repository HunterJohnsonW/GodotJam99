class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map
@onready var bag: LayerBag = $CanvasLayer/BG/LayerBag

func _ready() -> void:
	for layer in map.layers:
		layer.clicked.connect(_try_pick_up)

func _connect_bag() -> void:
	for held_layer in bag.get_children():
		held_layer._layer.place_layer.connect(_try_place)

func _physics_process(delta: float) -> void:
	pass

func player_layer() -> Layer:
	return map.layers.get(player.layer)

func _try_pick_up(layer: Layer) -> void:
	if !layer.click_area.overlaps_body(player) && layer == map.layers.get(map.layers.size() - 1):
		var removed_layer = map.remove_layer(layer.layer)
		if removed_layer != null:
			var layer_to_bag = removed_layer.duplicate()
			layer_to_bag.original_node = removed_layer
			removed_layer.disable()
			layer_to_bag.in_bag = true
			bag.add_to_bag(layer_to_bag)
			_connect_bag()

func _try_place(layer: Layer, original_layer: Layer) -> void:
	if !original_layer.click_area.overlaps_body(player):
		original_layer.enable()
		layer.queue_free()
