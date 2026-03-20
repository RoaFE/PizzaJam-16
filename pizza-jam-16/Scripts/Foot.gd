extends MeshInstance3D

@export var _playerChar : CharacterBody3D

@export var _moveDist := 0.05;

@onready var _targetPos : Vector3 = global_position

@export var _time := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(_playerChar.is_on_floor()):
		_time += _playerChar.velocity.length() * delta * 10
		position.y = max(0, sin(_time) * 0.022)
		position.z = cos(_time) * 0.022
	
	
