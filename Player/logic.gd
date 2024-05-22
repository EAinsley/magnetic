extends Node

@onready var magnetic: Magnetic = $Magnetic

func _on_raycasting_camera_right_mouse_clicked(collider: Object) -> void:
	# Check if object is magnetic
	if !collider.magnetic:
		printerr("No magnetic extract")
		return
	var that_magnetic : Magnetic = collider.magnetic as Magnetic
	# If it is, do the corresponding logic
	print("get magnetic: ", that_magnetic, ", plority: ", that_magnetic.current_plority)
	if (
		magnetic.current_plority != Magnetic.Plority.NEUTRAL 
		and that_magnetic.current_plority == Magnetic.Plority.NEUTRAL
	):
		that_magnetic.inject(magnetic.extract())
		print("inject")
	elif (
		magnetic.current_plority == Magnetic.Plority.NEUTRAL
		and that_magnetic.current_plority != Magnetic.Plority.NEUTRAL
	):
		magnetic.inject(that_magnetic.extract())
		print("extract")
	pass # Replace with function body.
