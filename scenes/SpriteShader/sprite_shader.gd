extends Sprite2D

@export var speed: float = 512
var selected: bool = false

func _process(delta):
	if selected:
		global_position = get_global_mouse_position()
	else:
		position += Vector2(
			int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
			int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")),
		) * speed * delta

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		selected = event.pressed


func _on_distortion_slider_value_changed(value):
	(self.material as ShaderMaterial).set_shader_parameter("distortion", value)

func _on_distortion_speed_slider_value_changed(value):
	(self.material as ShaderMaterial).set_shader_parameter("distortion_speed", value)
