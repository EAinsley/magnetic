extends Spatial

onready var mesh_instance = $MeshInstance
var is_hovered = false

func _process(delta):
	# 假设你的模型是MeshInstance节点
	var mouse_pos = get_viewport().get_mouse_position()
	var global_mouse_pos = to_global(mouse_pos)
	var is_inside = mesh_instance.get_world().canvas_item.is_point_over(mouse_pos)
	
	if is_inside:
		if not is_hovered:
			# 鼠标进入时，打开描边效果
			is_hovered = true
			mesh_instance.material_override.next_pass = "EdgeShader"
	else:
		if is_hovered:
			# 鼠标离开时，关闭描边效果
			is_hovered = false
			mesh_instance.material_override.next_pass = ""

	# 根据需要更新描边宽度或颜色等参数
	# mesh_instance.material_override.set_shader_param("edge_width", new_width)
	# mesh_instance.material_override.set_shader_param("edge_color", new_color)
