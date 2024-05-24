class_name Pickable
extends Node

signal picked
signal released
@onready var parent : RigidBody3D = get_parent()

func _ready() -> void:
	if parent is RigidBody3D:
		parent = get_parent()
		parent.add_to_group("pickable")
	else: 	
		printerr("only rigidbody can be picked")
	
func pick() -> void: 
	parent.set_collision_layer_value(2, false)
	parent.set_collision_layer_value(4, true)
	parent.set_collision_mask_value(1, false)
	picked.emit()

func release() -> void:
	parent.set_collision_layer_value(2, true)
	parent.set_collision_layer_value(4, false)
	parent.set_collision_mask_value(1, true)
