extends Node

@export var _objectiveManager : ObjectiveManager
@export var menuPath : String
@export var reviewPath : String

func _ready() -> void:
	_objectiveManager.AllObjectivesComplete.connect(LevelCompleted)

func LoadMenu():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GameManager.LoadScene(menuPath)
	queue_free()

func LoadReview():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GameManager.LoadScene(reviewPath)
	queue_free()

func LevelCompleted():
	LoadReview()
