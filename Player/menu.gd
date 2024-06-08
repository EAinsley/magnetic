extends Control

var is_paused: bool = false :
	set(value):
		is_paused = value
		if is_paused:
			get_tree().paused = true
			visible = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			get_tree().paused = false
			visible = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		is_paused = !is_paused
		
func _on_continue_pressed() -> void:
	is_paused = false


func _on_retry_pressed() -> void:
	is_paused = false
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().quit()
