extends Camera2D

enum CameraState{IDLE, SHAKE, CUTSCENE}

@export var left_up_limit = NodePath()
@export var right_down_limit = NodePath()

var state:CameraState = CameraState.IDLE

var force_shake:float = 750



func _ready() -> void:
	get_node("Timer").timeout.connect(_on_timeout)
	make_current()
	_set_limits()

func _process(delta:float) -> void:
	
	if state == CameraState.SHAKE:
		offset = delta * force_shake * get_random_vector()


func _set_limits() -> void:
	if left_up_limit and right_down_limit:
		limit_top = get_node(left_up_limit).position.y
		limit_left = get_node(left_up_limit).position.x 
		limit_right = get_node(right_down_limit).position.x 
		limit_bottom = get_node(right_down_limit).position.y  

func get_random_vector() -> Vector2:
	return Vector2(
		randf_range(-1, 1),
		randf_range(-1, 1)
	)


func _on_timeout() -> void:
	state = CameraState.IDLE
	offset = Vector2.ZERO
