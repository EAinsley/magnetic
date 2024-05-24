extends RayCast3D

signal colliding_state_changed(state: bool)
signal left_mouse_clicked(collider: Node3D)
signal right_mouse_clicked(collider: Node3D)

var _collider : Node3D
var _is_colliding : bool = false
var _enabled : bool = true


func _process(delta: float) -> void:
	_update_collider()


func _update_collider() -> void:
	_collider = get_collider()
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
		print("raycast left mouse clicked ", _collider)
		left_mouse_clicked.emit(_collider)
	if event.is_action_pressed("extract") and _is_colliding and _collider.is_in_group("magnetic"):
		print("raycast right mouse clicked", _collider)
		right_mouse_clicked.emit(_collider)
	

func _on_hand_held() -> void:
	set_process_input(false)
	set_process(false)
	print("process input false")


func _on_hand_released() -> void:
	set_process_input(true)
	set_process(true)
