extends AnimationPlayer

@export var left_door: MagneticDoor
@export var right_door: MagneticDoor
var is_closed: bool = true

var left_magnetic: Magnetic:
	set(value):
		left_magnetic = value
		if value:
			print("connect left magnetic")
			left_magnetic.plority_changed.connect(_on_plority_changed)
var right_magnetic: Magnetic:
	set(value):
		print("connect right magnetic")
		right_magnetic = value
		if value:
			right_magnetic.plority_changed.connect(_on_plority_changed)
		
func _ready() -> void:
	left_door.set_magnetic.connect(func(magnetic: Magnetic): left_magnetic = magnetic)
	right_door.set_magnetic.connect(func(magnetic: Magnetic): right_magnetic = magnetic)

func _on_plority_changed(_new: Magnetic.Plority, _old: Magnetic.Plority):
	print("plority changed: ", left_magnetic, ", ", right_magnetic)
	if left_magnetic && right_magnetic:
		print("change to: ", left_magnetic.current_plority, ", ", right_magnetic.current_plority)
		
	if (!left_magnetic || !right_magnetic 
		|| left_magnetic.current_plority == Magnetic.Plority.NEUTRAL 
		|| right_magnetic.current_plority == Magnetic.Plority.NEUTRAL):
		return
	if !is_closed && left_magnetic.current_plority != right_magnetic.current_plority:
		print("close door")
		is_closed = true
		play_backwards("open")
	elif is_closed && left_magnetic.current_plority == right_magnetic.current_plority:
		print("open door")
		play("open")
		is_closed = false
