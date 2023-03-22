extends Control

func _ready():
	$switchRect/switch.play_backwards("switch")
	await get_tree().create_timer(0.5).timeout
	$switchRect.visible = false
#	$ButtonPlay/pulse.play("pulse")

func _on_button_play_pressed():
	$switchRect.visible = true
	$switchRect/switch.play("switch")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/GUI/Levels.tscn")

func anim_grab(v) -> void:
	if v == 1:
		var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		$ButtonPlay.scale = Vector2.ONE 
		tween.tween_property($ButtonPlay, "scale", Vector2.ONE * 1.1, 0.3)
	else:
		var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		$ButtonPlay.scale = Vector2(1.1,1.1) 
		tween.tween_property($ButtonPlay, "scale", Vector2.ONE, 0.3)

func _on_button_play_mouse_entered():
	anim_grab(1)
func _on_button_play_mouse_exited():
	anim_grab(2)


