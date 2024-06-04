extends MeshInstance3D


const NEGTIVE_MATERIAL = preload("res://Arts/Textures/negative_material.tres")
const POSITIVE_MATERIAL = preload("res://Arts/Textures/positive_material.tres")


func _on_magnetic_plority_changed(plority: Magnetic.Plority, _old_plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.NEGATIVE:
			mesh.surface_set_material(0, NEGTIVE_MATERIAL)
		Magnetic.Plority.POSITIVE:
			mesh.surface_set_material(0, POSITIVE_MATERIAL)
