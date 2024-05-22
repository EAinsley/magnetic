extends Node3D

@export var speed := 44.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var weight := clampf(delta * speed, 0.0, 1.0)
	global_transform = global_transform.interpolate_with(get_parent().global_transform, weight)
	global_position = get_parent().global_position
