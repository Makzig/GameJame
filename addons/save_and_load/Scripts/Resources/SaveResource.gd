extends Resource
class_name SaveResource


const SAVE_GAME_PATH = "user://save.tres"

@export var inventory:Dictionary
@export var questions:Dictionary 
@export var some_values:Dictionary
@export var map_name:String
@export var player_position:Vector2



static func save_exist() -> bool:
	return ResourceLoader.exists(SAVE_GAME_PATH)

static func load_save() -> SaveResource:
	return ResourceLoader.load(SAVE_GAME_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)


func write_save_game() -> void:
	ResourceSaver.save(self, SAVE_GAME_PATH)




