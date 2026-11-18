class_name Layer
extends Node2D

@onready var click_area : Area2D = $ClickArea
@onready var wall : TileMapLayer = $Wall
@onready var floor : TileMapLayer = $Floor


@export var layer : int

var _wall_collision : TileMapLayer

signal clicked(layer: Layer)

func _ready() -> void:
	click_area.input_event.connect(_try_pick_up)

func _try_pick_up(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("click"):
		clicked.emit(self)
