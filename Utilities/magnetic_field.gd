extends Area3D

@export var magnetic: Magnetic
@export var magnetic_forces := 100

@onready var in_range_object: Array[RigidBody3D] = []

func _ready() -> void:
	magnetic.plority_changed.connect(_on_magnetic_plority_changed)

func _physics_process(delta: float) -> void:
	_apply_forces()
	pass

#
func _apply_forces() -> void:
	for body in in_range_object:
		var body_magnetic : Magnetic = body.magnetic as Magnetic
		if body_magnetic.current_plority == Magnetic.Plority.NEUTRAL:
			continue
		var distance_square = global_position.distance_squared_to(body.global_position)
		var force = (body.global_position - global_position).normalized() / distance_square  * magnetic_forces
		print("apply forces to body ", body.name, ", ", force)
		if magnetic.current_plority == body_magnetic.current_plority:
			body.apply_central_force(force)
		else:
			body.apply_central_force(-force)


func _on_body_entered(body: Node3D) -> void:
	if body != get_parent() and body.is_in_group("magnetic") and body is RigidBody3D:
		print(get_parent().name, "'s magnetic field detect object", body.name)
		if body not in in_range_object:
			in_range_object.append(body)
		

func _on_body_exited(body: Node3D) -> void:
	if body in in_range_object:
		in_range_object.erase(body)

		
func  _on_magnetic_plority_changed(plority: Magnetic.Plority):
	if plority == Magnetic.Plority.NEUTRAL:
		print("diable magnetic field")
		set_physics_process(false)
	else:
		print("enable magnetic field")
		set_physics_process(true)
