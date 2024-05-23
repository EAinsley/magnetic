class_name Pickable
extends Node

var parent : Node3D

func _ready() -> void:
	parent = get_parent()
	parent.add_to_group("pickable")
