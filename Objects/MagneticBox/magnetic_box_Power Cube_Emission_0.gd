extends MeshInstance3D


const NEGATIVE_MESH = preload("res://Objects/MagneticBox/magnetic_box_negative.tres")
const POSITIVE_MESH = preload("res://Objects/MagneticBox/magnetic_box_positive.tres")


func _on_magnetic_plority_changed(plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.POSITIVE:
			mesh = POSITIVE_MESH
		Magnetic.Plority.NEGATIVE:
			mesh = NEGATIVE_MESH
