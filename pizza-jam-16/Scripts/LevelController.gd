extends Node

@export var _objectiveManager : ObjectiveManager
@export var menuPath : String
@export var reviewPath : String

func _ready() -> void:
	_objectiveManager.AllObjectivesComplete.connect(LevelCompleted)

func LoadMenu():
	GameManager.LoadScene(menuPath)
	queue_free()

func LoadReview():
	GameManager.LoadScene(reviewPath)
	queue_free()

func LevelCompleted():
	LoadReview()
