extends AnimationPlayer

func _on_magnetic_plority_changed(plority: Magnetic.Plority, old_plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.POSITIVE:
			play("to_positive")
		Magnetic.Plority.NEGATIVE:
			play("to_negative")
		Magnetic.Plority.NEUTRAL:
			if old_plority == Magnetic.Plority.POSITIVE:
				play_backwards("to_positive")
			else:
				play_backwards("to_negative")
