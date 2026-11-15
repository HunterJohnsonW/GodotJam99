extends Control

func _on_play_pressed() -> void:
    get_tree().change_scene_to_file("res://menus/menu_scenes/level_select.tscn")

func _on_controls_pressed() -> void:
    get_tree().change_scene_to_file("res://menus/menu_scenes/controls.tscn")
