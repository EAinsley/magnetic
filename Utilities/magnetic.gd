class_name Magnetic
extends Node

signal plority_changed(plority: Plority)

enum Plority {NEUTRAL, POSITIVE, NEGATIVE}

@export var initial_plority : Plority

var current_plority : Plority :
	set(value):
		current_plority = value
		plority_changed.emit(current_plority)
		print(get_parent().name, "'s plority change to ", value)

func _ready() -> void:
	current_plority = initial_plority
	get_parent().add_to_group("magnetic")

func extract() -> Plority:
	var extracted_plority = current_plority
	current_plority = Plority.NEUTRAL
	return extracted_plority

func inject(new_plority : Plority) -> void:
	if current_plority == Plority.NEUTRAL:
		current_plority = new_plority
