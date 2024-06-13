extends Control

var texture: Texture2D:
	set(value):
		texture_rect.texture = value
		print("set texture")
var heading: String:
	set(value):
		heading_label.text = value
var details: String:
	set(value):
		detail_lable.text = value
		print("set text:", detail_lable.text)
		
@onready var texture_rect: TextureRect = $VBoxContainer/Panel/MarginContainer/HBoxContainer/TextureRect
@onready var heading_label: Label = $VBoxContainer/Panel/MarginContainer/HBoxContainer/Container/HeadingLabel
@onready var detail_lable: Label = $VBoxContainer/Panel/MarginContainer/HBoxContainer/Container/HBoxContainer/ScrollContainer/CenterContainer/DetailLable

func _ready() -> void:
	visible = false

func _on_button_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	queue_free()
