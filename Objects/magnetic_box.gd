class_name MagneticBox
extends RigidBody3D

@export var initial_plority : Magnetic.Plority = Magnetic.Plority.NEUTRAL

@onready var pickable: Pickable = $Logics/Pickable
@onready var magnetic: Magnetic = $Logics/Magnetic
@onready var mesh: MeshInstance3D = $Mesh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if magnetic:
		magnetic.current_plority = initial_plority

func get_mesh():
	return mesh.mesh
						
