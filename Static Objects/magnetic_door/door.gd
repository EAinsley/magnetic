class_name MagneticDoor
extends AnimatableBody3D

signal set_magnetic(magnetic: Magnetic)

var has_initialized := false
var is_magnetic: bool
var magnetic: Magnetic

const MAGNETIC = preload("res://Utilities/magnetic.tscn")
const EXTRACTABLE = preload("res://Utilities/extractable.tscn")

@onready var magnetic_field: MagneticField = $MagneticField
@onready var mesh_manager: MeshManager = $MeshManager
@onready var mesh: MeshInstance3D = $CollisionShape3D/Mesh


func initialize(data: MagneticData, extractor: MagneticExtractor):
	if !data:
		printerr(name, " in ", owner.name, " haven't been initialized")
	if has_initialized: 
		printerr(name, " in ", owner.name, " has been initialized twice")
	is_magnetic = data.is_magnetic
	
	if data.is_magnetic:
		magnetic = MAGNETIC.instantiate()
		add_child(magnetic)
		magnetic_field.magnetic = magnetic
		mesh_manager.connect_magnetic(magnetic)
		print("set magnetic")
		set_magnetic.emit(magnetic)
		if extractor:
			extractor.target = self
			extractor.target_magnetic = magnetic
		
	if data.is_extractable:
		var extractable = EXTRACTABLE.instantiate()
		extractable.magnetic = magnetic
		add_child(extractable)
		mesh.mesh.material.emission_enabled = true
		
	magnetic.current_plority = data.initial_plority
	has_initialized = true
	

	
