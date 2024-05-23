class_name Pickable
extends Node

var old_grandparent 
var parent : Node3D

@export var ghost: Node3D

func _ready() -> void:
	parent = get_parent()
	parent.add_to_group("pickable")
	old_grandparent = get_parent().get_parent()
	ghost.visible = false

func pickup(hand: Node3D) -> Node3D:
	if parent is RigidBody3D:
		print("freeze")
		parent.freeze = true
		parent.set_collision_layer_value(2, false)
	parent.reparent(hand)
	parent.transform = hand.transform
	return ghost
	
	
func dropdown(position: Vector3):
	parent.global_rotation_degrees = Vector3.ZERO
	parent.global_rotation_degrees.y = floor((parent.global_rotation_degrees.y + 45) / 90) * 90
	parent.global_position = position
	parent.reparent(old_grandparent)
	if get_parent() is RigidBody3D:
		print("unfreeze")
		parent.freeze = false
		parent.set_collision_layer_value(2, true)
		
	
	
	
