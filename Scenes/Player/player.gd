extends CharacterBody2D
class_name Player

var last_input:Vector2i
@onready var anim_tree:AnimationTree = $AnimationTree
@onready var anim_playback:AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")





func set_blend_position(blend_node:String, blend_position:Vector2) -> void:
	anim_tree.set("parameters/&s/blend_position"  % blend_node, blend_position ) 



