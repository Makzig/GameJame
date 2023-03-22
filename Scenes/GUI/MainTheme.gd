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

func anim_grab(forward:bool = false) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	var origin_scale = Vector2.ONE
	var need_scale = Vector2.ONE * 1.5
	var time = 0.5
	if !forward:
		$ButtonPlay.scale = origin_scale
		tween.tween_property($ButtonPlay, "scale", need_scale, time)
	elif forward:
		$ButtonPlay.scale = need_scale 
		tween.parallel().tween_property($ButtonPlay, "scale", origin_scale,  time)

func _on_button_play_mouse_entered():
	anim_grab()

func _on_button_play_mouse_exited():
	anim_grab(true)


