extends Control

var advices = [
	"совет №1",
	"совет №2",
	"совет №3"]
#@onready var buttons = [$list.get_children()]	#можно проще
var buttons = ["lvl1", "lvl2", "lvl3", "lvl4", "lvl5"]
var save:SaveResource

func _ready():
	
	$list/lvl1.grab_focus()
	
	for button in buttons:
		$list.get_node(button).pressed.connect(_on_pressed)
	
	$advice.text = advices[randi_range(0,2)]
	$switchRect/switch.play_backwards("switch")
	await get_tree().create_timer(0.5).timeout
	$switchRect.visible = false

func _on_button_back_pressed():
	change_scene("res://Scenes/GUI/MainTheme.tscn")
func _on_pressed() -> void:
	if $list/lvl1.button_pressed:
		change_scene("res://Scenes/Levels/1_level.tscn")
	if $list/lvl2.button_pressed:
		change_scene("res://Scenes/Levels/2_level.tscn")
	if $list/lvl3.button_pressed:
		pass
	if $list/lvl4.button_pressed:
		pass
	if $list/lvl5.button_pressed:
		pass

func change_scene(path):
	var tween = create_tween()
	$switchRect.visible = true
	tween.tween_property($switchRect, "color", Color(1,1,1,1), 0.5)
	await tween.finished
	get_tree().change_scene_to_file(path)
