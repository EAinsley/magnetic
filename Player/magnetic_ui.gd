extends TextureRect

@export var positive_texture : Texture2D
@export var normal_texture: Texture2D
@export var negative_texture: Texture2D



func _on_magnetic_plority_changed(plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.NEUTRAL:
			texture = normal_texture
		Magnetic.Plority.POSITIVE:
			texture = positive_texture
		Magnetic.Plority.NEGATIVE:
			texture = negative_texture
