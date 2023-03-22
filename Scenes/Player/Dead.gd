extends State



func enter_state(_need:Dictionary = {}) -> void:
	var player:Player = owner as Player
	player.anim_tree.set_active(false)
	player.get_node("AnimationPlayer").play("Dead")
	EventBus.killed.emit()

	
