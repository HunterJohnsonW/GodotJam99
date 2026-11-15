extends Control

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://menus/menu_scenes/main_menu.tscn")

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/menu_scenes/main_menu.tscn")
