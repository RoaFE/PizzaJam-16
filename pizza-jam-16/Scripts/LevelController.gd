extends Node

@export var _objectiveManager : ObjectiveManager
@export var menu : PackedScene

func _ready() -> void:
	_objectiveManager.AllObjectivesComplete.connect(LevelCompleted)

func LoadMenu():
	var scene = menu.instantiate()
	get_tree().root.add_child(scene)
	queue_free()

func LevelCompleted():
	LoadMenu()
