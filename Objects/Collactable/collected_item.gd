extends Area3D


func _on_body_entered(body: Node3D) -> void:
	print("collact Object")
	queue_free()
