extends Marker3D

signal held
signal released

@export var drag_force := 1.0
@export var drop_distance := 2.0

var is_holding := false
var target: RigidBody3D
var pickable: Pickable

func _ready() -> void:
	set_process_input(false)

func _physics_process(delta: float) -> void:
	if is_holding:
		if(target.global_position.distance_squared_to(global_position) > drop_distance * drop_distance):
			print("drop")
			_release()
			return
		target.apply_impulse((global_position - target.global_position) * drag_force * delta * 1000 - target.linear_velocity)
		target.apply_torque_impulse(-target.angular_velocity * delta)
func _input(event: InputEvent) -> void:
	if is_holding and event.is_action_released("pick_up"):
		_release()

func _pickup(collider: Node3D) -> void:
	print("hand pick up")
	if !collider is RigidBody3D or !collider.pickable:
		printerr("The object is not pickable: ", collider)
		return
	target = collider as RigidBody3D
	pickable = target.pickable as Pickable
	is_holding = true
	pickable.pick()
	held.emit()
	set_process_input(true)
	
func _release() -> void:
	is_holding = false
	released.emit()
	pickable.release()
	print("hand release")
		

func _on_interaction_left_mouse_clicked(collider: Node3D) -> void:
	_pickup(collider)
