extends Node

@export var magnetic : Magnetic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	magnetic.host.add_to_group("extractable")
