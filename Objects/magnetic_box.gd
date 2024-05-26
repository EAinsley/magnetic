extends RigidBody3D

@export var initial_plority : Magnetic.Plority
@export var is_pickable : bool = true


var pickable: Node 
@onready var magnetic: Magnetic = $Magnetic
@onready var mesh: MeshInstance3D = $Mesh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if magnetic:
		magnetic.current_plority = initial_plority
	if is_pickable:
		var pickable_logic = Pickable.new()
		pickable = pickable_logic
		add_child(pickable_logic)

func get_mesh():
	return mesh.mesh
						
