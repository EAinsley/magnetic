extends StaticBody3D

@export var trigger_target: Node3D #in the future
@export var plority: Magnetic.Plority


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var magnetic: Magnetic = $Magnetic
@onready var trigger_area: Area3D = $TriggerArea

var is_triggered := false

func _ready() -> void:
	magnetic.current_plority = plority

func _trigger():
	print("trigger target: ", trigger_target)
	if !trigger_target.triggerable:
		printerr(trigger_target.name, " is not triggerable")
	var triggerable : Triggerable = trigger_target.triggerable
	triggerable.trigger()
	animation_player.play("trigger")
	print("Triggered")
	is_triggered = true
	
	
func _untrigger():
	animation_player.play("untrigger")
	print("Untriggered")
	is_triggered = false
	var triggerable : Triggerable = trigger_target.triggerable
	triggerable.untrigger()
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if !is_triggered:
		_trigger()
		

func _on_area_3d_body_exited(body: Node3D) -> void:
	if trigger_area.get_overlapping_bodies().size() == 0:
		_untrigger()
