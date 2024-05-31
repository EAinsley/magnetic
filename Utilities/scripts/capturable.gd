extends Node

@export var host: Node3D

func _ready() -> void:
	host.add_to_group("capturable")
