extends MeshInstance3D

@export var _time := 0.0
@export var _playerChar : CharacterBody3D 

@onready var _startPos : Vector3 = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(_playerChar.is_on_floor()):
		_time += _playerChar.velocity.length() * delta * 12
		position.y = _startPos.y + sin(_time) * 0.005
		position.z = _startPos.z + cos(_time) * 0.005
	else:
		position.y = move_toward(position.y, _startPos.y + (-_playerChar.velocity.y * 0.01), delta * .07)
