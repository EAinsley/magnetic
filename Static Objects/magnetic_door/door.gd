class_name MagneticDoor
extends AnimatableBody3D

var has_initialized := false
var is_magnetic: bool
var current_plority: Magnetic.Plority
var magnetic: Magnetic

const MAGNETIC = preload("res://Utilities/magnetic.tscn")
const EXTRACTABLE = preload("res://Utilities/extractable.tscn")

@onready var magnetic_field: MagneticField = $MagneticField

func initialize(data: MagneticData):
	if !data:
		printerr(name, " in ", owner.name, " haven't been initialized")
	if has_initialized: 
		printerr(name, " in ", owner.name, " has been initialized twice")
	is_magnetic = data.is_magnetic
	if data.is_magnetic:
		magnetic = MAGNETIC.instantiate()
		add_child(magnetic)
		magnetic_field.magnetic = magnetic
	if data.is_extractable:
		var extractable = EXTRACTABLE.instantiate()
		extractable.magnetic = magnetic
		add_child(extractable)
	current_plority = data.initial_plority
		
	has_initialized = true
