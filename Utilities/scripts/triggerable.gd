class_name Triggerable
extends Node

signal triggered
signal untriggered

@export var host : Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !host:
		host = get_parent()
	host.add_to_group("triggerable")
	
func trigger():
	triggered.emit()

func untrigger():
	untriggered.emit()
