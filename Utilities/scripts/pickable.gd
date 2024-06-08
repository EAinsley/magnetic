class_name Pickable
extends Node

signal picked
signal released
@export var host : RigidBody3D 

func _ready() -> void:
	if !host: 	
		printerr("host not set")
		
	host.add_to_group("pickable")
	
func pick() -> void: 
	host.s ,,et_collision_layer_value(2, false)
	host.set_collision_layer_value(4, true)
	host.set_collision_mask_value(1, false)
	picked.emit()

func release() -> void:
	host.set_collision_layer_value(2, true)
	host.set_collision_layer_value(4, false)
	host.set_collision_mask_value(1, true)
