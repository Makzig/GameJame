extends Node


var inventory:Dictionary
var save:SaveResource
var question:Dictionary
var some_values:Dictionary
var map_name:String
var player_position:Vector2

func load_game() -> void:
	if SaveResource.save_exist():
		save = SaveResource.load_save() as SaveResource
		some_values = save.some_values
		question = save.questions
		player_position = save.player_position
		map_name = save.map_name
		
	else:
		create_new_save()



func create_new_save() -> void:
	save = SaveResource.new()
	save.inventory = inventory
	save.map_name = map_name
	save.player_position = player_position
	save.questions = question
	save.write_save_game()

func save_game() -> void:
	save.inventory = inventory
	save.map_name = map_name
	save.player_position = player_position
	save.questions = question
	save.write_save_game()
