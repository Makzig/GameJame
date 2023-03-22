extends Control


func _ready():
	$switchRect/switch.play_backwards("switch")
	await get_tree().create_timer(0.5).timeout
	$switchRect.visible = false
#	$ButtonPlay/pulse.play("pulse")


func _on_button_play_pressed():
	change_scene("res://Scenes/GUI/Levels.tscn")


func anim_grab(forward:bool = false) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	var origin_scale = Vector2.ONE
	var need_scale = Vector2.ONE * 1.3
	var time = 1
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


func change_scene(path):
	var tween = create_tween()
	$switchRect.visible = true
	tween.tween_property($switchRect, "color", Color(1,1,1,1), 0.5)
	await tween.finished
	get_tree().change_scene_to_file(path)
