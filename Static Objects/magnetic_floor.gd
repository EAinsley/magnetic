extends StaticBody3D

@export var plority: Magnetic.Plority
@onready var magnetic: Magnetic = $Magnetic

func _ready() -> void:
	if magnetic:
		magnetic.current_plority = plority
