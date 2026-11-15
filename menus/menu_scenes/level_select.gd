extends Control

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://menus/menu_scenes/main_menu.tscn")

func _ready() -> void:
	var level_counter : int = 1
	for levels in GameData.level_data:
		if levels["level"] == level_counter:
			if levels["completed"] == true:
				level_counter += 1
				unlock_level(level_counter)
		print("level ", levels["level"], " is ", levels["completed"])

func unlock_level(level):
	var object_ref = get_node("TextureRect/Level" + str(level))
	print(object_ref)
	object_ref.disabled = false

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/menu_scenes/main_menu.tscn")

func _on_level_1_pressed() -> void:
	pass # Replace with function body.

func _on_level_2_pressed() -> void:
	pass # Replace with function body.

func _on_level_3_pressed() -> void:
	pass # Replace with function body.

func _on_level_4_pressed() -> void:
	pass # Replace with function body.

func _on_level_5_pressed() -> void:
	pass # Replace with function body.
