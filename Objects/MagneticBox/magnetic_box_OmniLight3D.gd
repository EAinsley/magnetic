extends OmniLight3D


const NEGATIVE_COLOR : Color = Color.AQUA;
const POSITIVE_COLOR : Color = Color.RED;




func _on_magnetic_plority_changed(plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.NEUTRAL:
			visible = false
		Magnetic.Plority.POSITIVE:
			light_color = POSITIVE_COLOR;
			visible = true
		Magnetic.Plority.NEGATIVE:
			light_color = NEGATIVE_COLOR;
			visible = true
