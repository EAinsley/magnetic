extends Button

@export var level_start: PackedScene




func _on_pressed() -> void:
	get_tree().change_scene_to_packed(level_start)
