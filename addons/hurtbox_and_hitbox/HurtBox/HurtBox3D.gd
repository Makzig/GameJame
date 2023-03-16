@icon("res://addons/hurtbox_and_hitbox/Icons/Icons2.svg")
extends Area3D
class_name HurtBox3D



@export var needs:Dictionary = {}
@export var max_health:float = 10
@onready var health = max_health

signal hurt(hitbox:HitBox2D)
signal killed

func _ready() -> void:
	area_entered.connect(_on_hitbox_entered)


func _on_hitbox_entered(area) -> void:
	if !area is HitBox2D:
		return
	take_damage(area.damage)
	

func take_damage(damage:float) -> void:
	if owner.has_method("take_damage"):
		owner.take_damage()
	health = min(0, health - damage)
	if health <= 0:
		killed.emit()
