extends RigidBody3D

@export var initial_plority : Magnetic.Plority
@export var normal_material : StandardMaterial3D
@export var positive_material : StandardMaterial3D
@export var negative_material : StandardMaterial3D


@onready var magnetic: Magnetic = $Magnetic

@onready var mesh: MeshInstance3D = $Mesh



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if magnetic:
		magnetic.plority_changed.connect(_on_magnetic_plority_changed)
		magnetic.current_plority = initial_plority
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_magnetic_plority_changed(plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.NEUTRAL:
			mesh.mesh.set("material", normal_material)
		Magnetic.Plority.POSITIVE:
			mesh.mesh.set("material", positive_material)
		Magnetic.Plority.NEGATIVE:
			mesh.mesh.set("material", negative_material)
						
