extends Node3D

@export var _lookSens : float = 15.0
@export var _minAngle : float = -20.0
@export var _maxAngle : float = 75.0

@export var _mouseDelta : Vector2 = Vector2()

signal RotationUpdate(rotation : Vector3)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
		if event is InputEventMouseMotion:
			_mouseDelta = event.relative
		if event is InputEventMouseButton:
			if event.button_index == 0:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
		if event is InputEventKey:
			if event.pressed && event.keycode == (KEY_ESCAPE):
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rot = Vector3(_mouseDelta.y, _mouseDelta.x, 0) * _lookSens * delta
	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, _minAngle, _maxAngle)
	
	rotation_degrees.y += rot.y;
	RotationUpdate.emit(rotation)
	
	_mouseDelta = Vector2()
