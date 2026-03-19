extends Node

@export var levelPath : String

func LoadLevel():
	GameManager.LoadScene(levelPath)
	queue_free()
	
func Quit():
	get_tree().quit()
