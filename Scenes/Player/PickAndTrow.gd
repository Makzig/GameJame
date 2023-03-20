extends State


var target:StaticBody2D
var time:float = 0.0
var is_throw:bool = false

func enter_state(_need:Dictionary = {}) -> void:
	if !_need.has("_target"):
		printerr("No has Target")
		return
	target = _need["_target"]
	if _need["is_picked"] == false:
		pick_object()
	else:
		is_throw = true


func physics_update(_delta:float) -> void:
	if is_throw:
		throw_object()


func pick_object() -> void:
	if target == null:
		printerr("Non target for tween")
	var tween := create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	tween.tween_property(target, "position", owner.position, 0.3)



func throw_object() -> void:
	target.position = target.position.lerp(target.position + (owner.last_input * 64), time)
	time += get_physics_process_delta_time()
