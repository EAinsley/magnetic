extends Node

@export var target: Node3D
@export var plority: Magnetic.Plority

var current_plority: Magnetic.Plority
var target_magnetic: Magnetic

@onready var triggerable: Triggerable = $Triggerable

func _ready() -> void:
	print("extractor ready")
	if !target:
		target = get_parent()
	current_plority = plority
	if target.is_in_group("magnetic"):
		target_magnetic = target.magnetic



func _on_triggerable_triggered() -> void:
	_get_magnetic()
	if target_magnetic:
		_swap_plority()


func _on_triggerable_untriggered() -> void:
	_get_magnetic()
	if target_magnetic:
		_swap_plority()

func _get_magnetic() -> void:
	if !target_magnetic:
		target_magnetic = target.magnetic

func _swap_plority() -> void:
	var tmp_plority := target_magnetic.current_plority
	target_magnetic.current_plority = current_plority
	current_plority = tmp_plority
