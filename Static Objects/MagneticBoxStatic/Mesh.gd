extends MeshInstance3D

const NEGATIVE_STATIC = preload("res://Static Objects/MagneticBoxStatic/negative_static.tres")
const NEUTRAL_STATIC = preload("res://Static Objects/MagneticBoxStatic/neutral_static.tres")
const POSITIVE_STATIC = preload("res://Static Objects/MagneticBoxStatic/positive_static.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_magnetic_plority_changed(plority: Magnetic.Plority, old_plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.POSITIVE:
			mesh.surface_set_material(0, POSITIVE_STATIC)
		Magnetic.Plority.NEGATIVE:
			mesh.surface_set_material(0, NEGATIVE_STATIC)
		Magnetic.Plority.NEUTRAL:
			mesh.surface_set_material(0, null)
