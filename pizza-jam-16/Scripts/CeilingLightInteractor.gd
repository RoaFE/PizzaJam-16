extends "res://Scripts/interactable.gd"

@export var _rigidBody : RigidBody3D


func Interact():
	if(_oneShot && _used):
		return
	super.Interact()
	_rigidBody.freeze = false
	_rigidBody.sleeping = false
	_rigidBody.apply_impulse(Vector3(15,2,0))
	_rigidBody.apply_torque(Vector3(30,65,-20))
	
