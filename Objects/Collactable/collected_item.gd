extends Area3D

@export var texture: Texture2D
@export var heading: String
@export_multiline var details: String

@onready var display_ui: Control = $DisplayUI

func _ready() -> void:
	display_ui.visible = false
	display_ui.texture = texture
	display_ui.heading = heading
	display_ui.details = details

func _on_body_entered(body: Node3D) -> void:
	display_ui.visible = true
	display_ui.reparent(get_parent())
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	queue_free()
