extends Control

@export var menuPath : String


func LoadMenu():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GameManager.LoadScene(menuPath)
	queue_free()
