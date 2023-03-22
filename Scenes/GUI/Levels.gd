extends Control

var advices = [
	"совет №1",
	"совет №2",
	"совет №3"]
var save:SaveResource




func _ready():
	$advice.text = advices[randi_range(0,2)]
	$switchRect/switch.play_backwards("switch")
	await get_tree().create_timer(0.5).timeout
	$switchRect.visible = false
