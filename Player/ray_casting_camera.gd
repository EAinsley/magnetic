extends Camera3D

signal colliding_state_changed(state: bool)
signal left_mouse_clicked(collider: Node3D)
signal right_mouse_clicked(collider: Node3D)

var _collider : Node3D
var _is_colliding : bool = false

@onready var interaction: RayCast3D = $Interaction

func _process(delta: float) -> void:
	_update_collider()

func _update_collider() -> void:
	_collider = interaction.get_collider()
	if _is_colliding and !_collider:
		print("not colliding")
		_is_colliding = false
		colliding_state_changed.emit(false)
	elif !_is_colliding and _collider:
		print("colliding")
		_is_colliding = true
		colliding_state_changed.emit(true)
		
func  _input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_up") and _is_colliding and _collider.is_in_group("pickable"):
		print("pick up ", _collider)
		left_mouse_clicked.emit(_collider)
	if event.is_action_pressed("extract") and _is_colliding and _collider.is_in_group("magnetic"):
		print("extract ", _collider)
		right_mouse_clicked.emit(_collider)
