extends Node3D

@onready var _modelDirection := -basis.z
@export var _turnSpeed : float = 1.0

@export var _time := 0.0
@export var _playerChar : CharacterBody3D 

func UpdateTargetDirection(direction : Vector3):
	_modelDirection = -direction;
	
func _process(delta: float) -> void:
	var angle := (basis.z).signed_angle_to(_modelDirection, Vector3(0,1,0)) * delta * _turnSpeed
	#if(angle < 0):
		#angle = max(-_turnSpeed, angle)
	#else:
		#angle = min(_turnSpeed, angle)
	basis = basis.rotated(Vector3(0,1,0), angle)
	
	if(_playerChar.is_on_floor()):
		_time += _playerChar.velocity.length() * delta * 20
		position.y = sin(_time) * 0.005
