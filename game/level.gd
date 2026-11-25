class_name Level
extends Node2D

@onready var player: Player = $Player
@onready var map: Stack = $Map
@onready var bag: LayerBag = $CanvasLayer/BG/LayerBag
#@onready var bag: TextureRect = $CanvasLayer/LayerBag


func _ready() -> void:
	for layer in map.layers:
		layer.clicked.connect(_try_pick_up)

func _physics_process(delta: float) -> void:
	pass

func player_layer() -> Layer:
	return map.layers.get(player.layer)

func _try_pick_up(layer: Layer) -> void:
	if !layer.click_area.overlaps_body(player) && layer == map.layers.get(map.layers.size() - 1):
		var removed_layer = map.remove_layer(layer.layer)
		if removed_layer != null:
			var layer_to_bag = removed_layer.duplicate()
			removed_layer.disable()
			bag.add_to_bag(layer_to_bag)
