extends "res://Scripts/interactable.gd"


func Interact():
	if(_oneShot && _used):
		return
	super.Interact()
	
