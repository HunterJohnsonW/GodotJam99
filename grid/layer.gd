class_name Layer
extends TileMapLayer

@onready var drag_area : Area2D = $DragArea

var moving = false
var last_mouse_pos : Vector2

var layer : int

signal clicked(layer: Layer)
signal released(layer: Layer)

func _ready() -> void:
	drag_area.input_event.connect(_handle_click_drag)
	drag_area.mouse_exited.connect(_handle_drop)
	pass


func get_pos_world(pos: Vector2i) -> Vector2:
	var local_pos = map_to_local(pos)
	return to_global(local_pos)

func _handle_click_drag(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouse:
		if event.is_action_pressed("click"):
			moving = true
			last_mouse_pos = get_viewport().get_mouse_position()
			clicked.emit(self)

		if event.is_action_released("click"):
			_handle_drop()

		if moving:
			var new_mouse_pos = viewport.get_mouse_position()
			var direction = new_mouse_pos - last_mouse_pos
			position += direction
			last_mouse_pos = new_mouse_pos


func _handle_drop():
	if moving:
		moving = false
		released.emit(self)
		_snap_to_multiple_of(64)


func _snap_to_multiple_of(multiple_of: int):
	position = position.snapped(Vector2(64.0, 64.0))
