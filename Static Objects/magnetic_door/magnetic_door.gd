class_name MagneticDoorSuit
extends Node3D

@export_group("Left Door")
@export var left_door_config: MagneticData
@export var left_door_trigger: Node3D # TODO: Change to plority_change_trigger

@export_group("Right Door")
@export var right_door_config: MagneticData
@export var right_door_trigger: Node3D # TODO: Change to plority_change_trigger


@onready var left_door: MagneticDoor = $Model/LeftDoor
@onready var right_door: MagneticDoor = $Model/RightDoor

func _ready() -> void:
	left_door.initialize(left_door_config)
	right_door.initialize(right_door_config)
