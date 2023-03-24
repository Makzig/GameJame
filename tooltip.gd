extends Node2D

@export var text = 'text here'

func _ready():
	$box/textbox.text = text

func _on_area_2d_body_entered(body):
	if body.name != "Player":
		return
	appear()
func _on_area_2d_body_exited(body):
	if body.name != "Player":
		return
	disappear()

func appear():
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	var box = get_node("box")
	tween.tween_property(box, "scale", Vector2(1,1), 1)
func disappear():
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	var box = get_node("box")
	tween.tween_property(box, "scale", Vector2(0,0), 1)
