extends Node

@export var level : PackedScene

func LoadLevel():
	var scene = level.instantiate()
	get_tree().root.add_child(scene)
	queue_free()
	
func Quit():
	get_tree().quit()
