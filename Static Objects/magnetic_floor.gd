extends StaticBody3D

@export var plority: Magnetic.Plority
@onready var magnetic: Magnetic = $Magnetic

var captured_body: RigidBody3D

func _ready() -> void:
	if magnetic:
		magnetic.current_plority = plority


func _on_captured_area_body_entered(body: Node3D) -> void:
	if body is RigidBody3D and !captured_body:
		captured_body = body as RigidBody3D
		
