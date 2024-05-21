extends RigidBody3D

@export var initial_plority : Magnetic.Plority
@onready var magnetic: Magnetic = $Magnetic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if magnetic:
		magnetic.current_plority = initial_plority

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
