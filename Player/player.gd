extends CharacterBody3D

@export_group("player control")
@export var mouse_sensitivity := 0.001
@export var head_x_min_degree := -90.0
@export var head_x_max_degree := 90.0

@export_group("physics")
@export_range(0., 50.) var gravity: float = 9.8
@export var jump_height := 1.3  ## in meter

@export var enable_right: bool = true

const SPEED = 5.0
var jump_speed : float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var mouse_motion := Vector2.ZERO

@onready var head: Node3D = $Head
@onready var interaction = $Head/Cameras/Interaction

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	jump_speed = sqrt(2 * gravity * jump_height)
	interaction.enable_extract = enable_right
	

func _physics_process(delta: float) -> void:
	# Handle rotation
	handle_camera_rotateion()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
func _input(event: InputEvent) -> void:
	# Record rotation
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouse_motion = -event.relative * mouse_sensitivity
	
	# Handle mouse escape

	
func handle_camera_rotateion():
	rotate_y(mouse_motion.x)
	head.rotate_x(mouse_motion.y)
	head.rotation_degrees.x = clampf(head.rotation_degrees.x, head_x_min_degree, head_x_max_degree)
	mouse_motion = Vector2.ZERO


