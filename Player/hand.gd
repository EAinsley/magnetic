extends Marker3D

signal held
signal released

@export var drag_force := 1.0

var is_holding := false
var target: RigidBody3D

func _ready() -> void:
	set_process_input(false)

func _physics_process(delta: float) -> void:
	if is_holding:
		target.apply_impulse((global_position - target.global_position) * drag_force * delta * 1000 - target.linear_velocity)
		target.apply_torque_impulse(-target.angular_velocity * delta)
func _input(event: InputEvent) -> void:
	if is_holding and event.is_action_released("pick_up"):
		is_holding = false
		released.emit()
		target.set_collision_layer_value(2, true)
		target.set_collision_layer_value(4, false)
		target.set_collision_mask_value(1, true)
		
		print("hand release")
		

func _pickup(collider: Node3D) -> void:
	print("hand pick up")
	if !collider is RigidBody3D or !collider.pickable:
		printerr("The object is not pickable: ", collider)
		return
	target = collider as RigidBody3D
	is_holding = true
	target.set_collision_layer_value(2, false)
	target.set_collision_layer_value(4, true)
	target.set_collision_mask_value(1, false)
	
	held.emit()
	set_process_input(true)

func _on_interaction_left_mouse_clicked(collider: Node3D) -> void:
	_pickup(collider)
