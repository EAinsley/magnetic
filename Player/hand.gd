extends Marker3D

signal held
signal released

var is_holding := false
var pickable : Pickable

@onready var putdown_ray: RayCast3D = $"../PutdownRay"

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_up") and is_holding and putdown_ray.get_collider():
		var target_point :Vector3 = putdown_ray.get_collision_point()
		print(putdown_ray.get_collision_point(), target_point)
		print(global_position, target_point.y - get_parent().global_position.y)
		if target_point.y > get_parent().global_position.y : # too high
			return
		set_process_input(false)
		is_holding = false
		pickable.dropdown(target_point)
		putdown_ray.disable()
		released.emit()
		print("release")
		
		

func _pickup(collider: Node3D) -> void:
	print("pick up")
	if !collider.pickable:
		printerr("The object is not pickable: ", collider)
		return
	pickable = collider.pickable as Pickable
	putdown_ray.ghost_mesh = pickable.pickup(self)
	putdown_ray.enable()
	set_process_input(true)
	is_holding = true
	held.emit()

func _on_interaction_left_mouse_clicked(collider: Node3D) -> void:
	_pickup(collider)
