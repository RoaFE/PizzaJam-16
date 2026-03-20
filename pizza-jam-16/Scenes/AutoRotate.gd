extends Node3D

@export var _axis : Vector3 = Vector3(0,1,0)
@export var _speed : float = 2

var _time : float = 0.0
func _process(delta: float) -> void:

	basis = basis.rotated(_axis, delta * _speed)
