extends Control

func _ready():
	$switchRect/switch.play_backwards("switch")
	await get_tree().create_timer(0.5).timeout
	$switchRect.visible = false
	$ButtonPlay/pulse.play("pulse")

func _on_button_play_pressed():
	$switchRect.visible = true
	$switchRect/switch.play("switch")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/GUI/Levels.tscn")
