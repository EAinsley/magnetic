class_name CapturedArea
extends Area3D

@export var magnetic: Magnetic


var is_captured: bool

@onready var captured_object: Array = []




func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("capturable") and body not in captured_object:
		print("capture body: ", body)
		captured_object.append(body)
	


func _on_body_exited(body: Node3D) -> void:
	if body in captured_object:
		print("remove captured body", body)
		captured_object.erase(body)
