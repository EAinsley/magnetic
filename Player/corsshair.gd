extends Control

@export var circle_size := 6.0
@export var circle_width := 2.0

var _is_colliding := false

func _draw() -> void:
	print("is colliding:", _is_colliding)
	if _is_colliding:
		draw_arc(Vector2.ZERO, circle_size, 0, PI * 2, 32, Color.YELLOW, circle_width, true)
	else:	
		print("draw red")
		draw_arc(Vector2.ZERO, circle_size, 0, PI * 2, 32, Color.LIGHT_GRAY, circle_width, true)



func _on_interaction_colliding_state_changed(state: bool) -> void:
	_is_colliding = state
	queue_redraw()
