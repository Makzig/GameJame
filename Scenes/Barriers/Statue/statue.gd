extends CharacterBody2D


var move_speed:float = 3500.0
var direction:Vector2
var is_move:bool = false
var _target

func _ready() -> void:
	$DetectArea.body_entered.connect(_on_entered)
	$DetectArea.body_exited.connect(_on_exited)


func _physics_process(delta):
	if _target and is_move:
		movement()



func _input(event):
	if Input.is_action_pressed("ui_up") and _target:
		is_move = true
	if Input.is_action_just_released("ui_up"):
		is_move = false

func movement() -> void:
	if _target:
		direction = _target.last_input
		velocity = move_speed * direction * get_physics_process_delta_time()
	move_and_slide()

func _on_entered(body) -> void:
	if body.is_in_group("Player"):
		direction = body.last_input 
		_target = body

func _on_exited(body) -> void:
	if body.is_in_group("Player"):
		direction = Vector2.ZERO
		_target = null
		is_move = false
