class_name Layer
extends Node2D

@onready var click_area : Area2D = $ClickArea
@onready var wall : TileMapLayer = $Wall
@onready var floor : TileMapLayer = $Floor

@export var layer : int

var _wall_collision : TileMapLayer

signal clicked(layer: Layer)
signal removed(layer: Layer)

func _ready() -> void:
	click_area.input_event.connect(_try_pick_up)

func _try_pick_up(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("click"):
		clicked.emit(self)
	
	await get_tree().process_frame

# returns the width of the walls
func width() -> int:
	var cells = wall.get_used_cells()	
	var xs = cells.map(func(c: Vector2i): return c.x)
	return xs.max() - xs.min()

# returns the height of the walls
func height() -> int:
	var cells = wall.get_used_cells()	
	var ys = cells.map(func(c: Vector2i): return c.y)
	return ys.max() - ys.min()

func global_wall_position() -> Vector2:
	var cells = wall.get_used_cells()	
	var ys = cells.map(func(c: Vector2i): return c.y)
	var xs = cells.map(func(c: Vector2i): return c.x)
	var min_x = xs.min()
	var min_y = ys.min()
	return wall.to_global(wall.map_to_local(Vector2i(min_x, min_y)))

func disable() -> void:
	click_area.monitoring = false
	visible = false

func enable() -> void:
	click_area.monitoring = true
	visible = true
