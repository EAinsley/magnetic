extends MeshInstance3D

@export var button_positive_texture: Texture2D
@export var button_negative_texture: Texture2D
@export var button_nuetral_texture: Texture2D
const BUTTON_NEGATIVE = preload("res://Arts/other small things/button_negative.jpg")
const BUTTON_NEUTRAL = preload("res://Arts/other small things/button_neutral.jpg")
const BUTTON_POSITIVE = preload("res://Arts/other small things/button_positive.jpg")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_magnetic_plority_changed(plority: Magnetic.Plority, old_plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.POSITIVE:
			material_overlay.set("albedo_texture", button_positive_texture)
		Magnetic.Plority.NEGATIVE:
			material_overlay.set("albedo_texture", button_negative_texture)
		Magnetic.Plority.NEUTRAL:
			material_overlay.set("albedo_texture", button_negative_texture)
			
