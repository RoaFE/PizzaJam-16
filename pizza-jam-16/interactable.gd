@abstract
class_name Interactable

extends Node3D

@export var _oneShot : bool = false

var _used : bool = false

# Called when the node enters the scene tree for the first time.
func Interact():
	if(_oneShot):
		_used = true;
	pass
