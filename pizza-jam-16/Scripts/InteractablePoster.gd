extends "res://Scripts/interactable.gd"

@export var _rigidBody : RigidBody3D
@export var _explosion : CPUParticles3D

func Interact():
	if(_oneShot && _used):
		return
	super.Interact()
	_rigidBody.freeze = false
	_rigidBody.sleeping = false
	_rigidBody.apply_impulse(Vector3(0,5,0) + basis.z)
	_explosion.emitting = true
	
