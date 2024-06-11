extends StaticBody3D

@export var plority: Magnetic.Plority
@export var push_height: float = 3.0
@export var force: float = 3.0
@onready var magnetic: Magnetic = $Magnetic
@onready var captured_area: CapturedArea = $CapturedArea

var captured_body: RigidBody3D

func _ready() -> void:
	if magnetic:
		magnetic.current_plority = plority

func _physics_process(delta: float) -> void:
	_apply_forces(delta)
	
		
func _apply_forces(delta: float) -> void:
	if magnetic.current_plority == Magnetic.Plority.NEUTRAL:
		return
	for body in captured_area.captured_object:
		if not body.is_in_group("magnetic"):
			continue
		var body_magnetic: Magnetic = body.magnetic as Magnetic
		if body_magnetic.current_plority == Magnetic.Plority.NEUTRAL:
			return
		
		if body is RigidBody3D:
			if magnetic.current_plority != body_magnetic.current_plority:
				body.apply_central_force(-transform.basis.y * force * delta * 1000)
			else:
				var damp_velocity : Vector3 = body.linear_velocity.y * transform.basis.y
				var apply_force : Vector3 = basis.y * (push_height - (body.global_position - global_position).dot(basis.y))
				var calculated_force := apply_force * force * delta * 1000 - damp_velocity 
				body.apply_central_force(calculated_force)
				
