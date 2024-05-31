extends AnimationPlayer


func _on_magnetic_plority_changed(plority: Magnetic.Plority) -> void:
	match plority:
		Magnetic.Plority.NEUTRAL:
			play_backwards("Open")
		_:
			play("Open")
