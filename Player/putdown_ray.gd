extends RayCast3D

var ghost_mesh : Node3D:
	set(value):
		ghost_mesh = value
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disable()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_collider() and ghost_mesh:
		ghost_mesh.visible = true
		ghost_mesh.global_position = get_collision_point()
	elif !get_collider() and ghost_mesh:
		ghost_mesh.visible = false
		
func disable() -> void:
	set_process(false)
	if ghost_mesh:
		ghost_mesh.visible = false

func enable() -> void:
	set_process(true)
