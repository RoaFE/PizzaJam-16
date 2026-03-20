extends Node3D

@onready var _modelDirection := -basis.z
@export var _turnSpeed : float = 1.0

func UpdateTargetDirection(direction : Vector3):
	_modelDirection = -direction;
	
func _process(delta: float) -> void:
	var newDirection = -basis.z.move_toward(_modelDirection, _turnSpeed * delta)
	var up := Vector3(0,1,0)
	basis = Basis(up.cross(-newDirection), up, -newDirection).orthonormalized()
