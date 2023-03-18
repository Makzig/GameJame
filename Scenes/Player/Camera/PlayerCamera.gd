extends Camera2D

enum CameraState{IDLE, SHAKE, CUTSCENE}

var state:CameraState = CameraState.IDLE

var force_shake:float = 750



func _ready() -> void:
	get_node("Timer").timeout.connect(_on_timeout)
	make_current()

func _process(delta:float) -> void:
	
	if state == CameraState.SHAKE:
		offset = delta * force_shake * get_random_vector()


func get_random_vector() -> Vector2:
	return Vector2(
		randf_range(-1, 1),
		randf_range(-1, 1)
	)


func _on_timeout() -> void:
	state = CameraState.IDLE
	offset = Vector2.ZERO
