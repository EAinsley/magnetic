extends Node3D

@onready var triggerable: Node = $Triggerable

@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _open() -> void:
	print("door", name, " open")
	animation_player.play("open")
	
	
func _close() -> void:
	print("door ", name, " close")
	animation_player.play_backwards("open")

func _on_triggerable_triggered() -> void:
	_open()


func _on_triggerable_untriggered() -> void:
	_close()
