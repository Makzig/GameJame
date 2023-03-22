extends CharacterBody2D


var move_speed:float = 3500.0
var direction:Vector2i
var is_move:bool = false
var _target
var time:float = 0

func _ready() -> void:
	$DetectArea.body_entered.connect(_on_entered)
	#$DetectArea.body_exited.connect(_on_exited)
	set_physics_process(false)

func movement() -> void:
	position = position.lerp(direction * 32, time)

func _physics_process(delta):
	if time < 1:
		time += delta
		movement()
	else:
		is_move = false
		time = 0
		_target = null
		set_physics_process(false)


func _on_entered(body) -> void:
	if body.is_in_group("Player"):
		_target = body
		if !is_move:
			direction = body.last_input
			is_move = true
			set_physics_process(true)

