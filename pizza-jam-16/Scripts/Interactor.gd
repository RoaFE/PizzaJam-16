extends Node3D

@export var _rayCast : RayCast3D

var _curIntercatble : Interactable

signal InteractMessage(message : String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	if(_rayCast.is_colliding()):
		var object = _rayCast.get_collider()
		if object is CollisionObject3D and object is Interactable:
			EvaluateInteractable(object)
	else:
		EvaluateInteractable(null)
	if(Input.is_action_just_pressed("interact") && _curIntercatble != null):
		_curIntercatble.Interact();
			

func EvaluateInteractable(interactable : Interactable):
	if(interactable == _curIntercatble):
		return
	if(_curIntercatble != null):
		#clear up
		_curIntercatble = null
	_curIntercatble = interactable
	var message : String = ""
	if(_curIntercatble != null):
		message = _curIntercatble.GetMessage()
	InteractMessage.emit(message)

	
	
