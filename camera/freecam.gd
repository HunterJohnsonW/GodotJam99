class_name FreeCam
extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


func _process(delta: float) -> void:
    if Input.is_action_pressed("camera_pan"):
        position = lerp(position, position - Input.get_last_mouse_velocity(), delta)
        
    if Input.is_action_just_pressed("zoom_out"):
        zoom -= Vector2(0.05, 0.05)

    if Input.is_action_just_pressed("zoom_in"):
        zoom += Vector2(0.05, 0.05)
    pass
