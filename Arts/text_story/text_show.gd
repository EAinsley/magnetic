extends test_area

var player_entered = false

func _ready():
	# 确保Area是可交互的
	self.set_monitoring(true)

func _physics_process(delta):
	# 检查是否有玩家进入区域
	if player_entered:
		# 显示文本
		show_text()

func _on_Area_body_entered(body):
	# 检查进入的是否是玩家
	if body.name == "Player":  # 假设玩家节点的名称是Player
		player_entered = true

func show_text():
	var ui_layer = get_tree().get_root().find_node("CanvasLayer", true, false)
	var label = ui_layer.get_node("Label")
	label.text = "检测到玩家！"
	label.visible = true

# 如果需要，可以添加_on_Area_body_exited来隐藏文本
func _on_Area_body_exited(body):
	if body.name == "Player":
		player_entered = false
		var ui_layer = get_tree().get_root().find_node("CanvasLayer", true, false)
		var label = ui_layer.get_node("Label")
		label.visible = false
