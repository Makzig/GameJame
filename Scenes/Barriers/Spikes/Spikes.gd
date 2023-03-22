extends HitBox2D

enum SpikeState{BUTTON_EMIT, TIME_EMIT, ENTER_EMIT}
@export var state:SpikeState = SpikeState.ENTER_EMIT
@export  var floor_button = NodePath()
@export var time_offset:float = 0

@onready var button:FloorButton = get_node(floor_button) if floor_button != null else null
@onready var shape:CollisionShape2D = $CollisionShape2D

var is_attack:bool = false


func _ready() -> void:
	if state == SpikeState.BUTTON_EMIT and button:
		button.pressed.connect(_on_pressed)
		button.realeased.connect(_on_released)
		attack()
	if state == SpikeState.ENTER_EMIT:
		self.body_entered.connect(_on_entered)
		self.body_exited.connect(_on_exited)
	if state == SpikeState.TIME_EMIT:
		if time_offset > 0:
			await get_tree().create_timer(time_offset).timeout
		$Timer.connect("timeout", _on_timeout)



func _on_timeout() -> void:
	is_attack = !is_attack
	
	if is_attack:attack()
	else:idle()

func _on_entered(body) -> void:
	if body.is_in_group("Player"):
		attack()

func _on_exited(body) -> void:
	if body.is_in_group("Player"):
		idle()

func _on_pressed() -> void:
	idle()

func _on_released() -> void:
	attack()

func attack() -> void:
	$AnimationPlayer.play("await")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("Attack")

func idle() -> void:
	$AnimationPlayer.play("await")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("Idle")
