@abstract
class_name Interactable

extends PhysicsBody3D

@export var _oneShot : bool = false

@export var _interactMessage : String

@export var _used : bool = false

signal OnInteract()

# Called when the node enters the scene tree for the first time.
func Interact():
	if(_used):
		return
	if(_oneShot):
		_used = true;
	OnInteract.emit()


func GetMessage() -> String :
	if(_used):
		return ""
	return _interactMessage
	
func SetUsed(used : bool):
	_used = used
