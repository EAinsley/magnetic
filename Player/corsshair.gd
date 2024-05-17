extends Control

@export var circle_size := 6.0
@export var circle_width := 2.0

func _draw() -> void:
	draw_arc(Vector2.ZERO, circle_size, 0, PI * 2, 32, Color.WHITE, circle_width, true)
