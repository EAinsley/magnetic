class_name Magnetic
extends Node

signal plority_changed(plority: Plority)

enum Plority {NEUTRAL, POSITIVE, NEGATIVE}

@export var initial_plority : Plority
@export var is_extractable : bool
@export var normal_material : StandardMaterial3D
@export var positive_material : StandardMaterial3D
@export var negative_material : StandardMaterial3D
@export var mesh_instance : MeshInstance3D

var current_plority : Plority :
	set(value):
		current_plority = value
		plority_changed.emit(current_plority)
		print(get_parent().name, "'s plority change to ", value)
		if mesh_instance:
			_change_mesh()

func _ready() -> void:
	current_plority = initial_plority
	get_parent().add_to_group("magnetic")
	print(get_parent().name, "'s mesh instance", mesh_instance)
	if is_extractable:
		get_parent().add_to_group("extractable")

func extract() -> Plority:
	var extracted_plority = current_plority
	current_plority = Plority.NEUTRAL
	return extracted_plority

func inject(new_plority : Plority) -> void:
	if current_plority == Plority.NEUTRAL:
		current_plority = new_plority
		
func _change_mesh():
	print("change mesh")
	match current_plority:
		Magnetic.Plority.NEUTRAL:
			mesh_instance.mesh.set("material", normal_material)
		Magnetic.Plority.POSITIVE:
			mesh_instance.mesh.set("material", positive_material)
		Magnetic.Plority.NEGATIVE:
			mesh_instance.mesh.set("material", negative_material)
