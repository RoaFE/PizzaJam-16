extends "res://Scripts/tool.gd"

@export var _drillHole : PackedScene

func Action():
	super.Action()
	
	var result = super.ShootRay()
	if result:
		#if(result.position - global_position).length() < _range * _range:
		print("Hit at point: ", result.position)
		var hole = _drillHole.instantiate() as Node3D
		get_tree().root.add_child(hole)
		hole.transform = align_with_z(hole.transform, result.normal)
		hole.global_position = result.position;


## Transfer to Util Class
func align_with_z(xform, new_z):
	xform.basis.z = new_z
	xform.basis.x = -xform.basis.y.cross(new_z)
	xform.basis = xform.basis.orthonormalized()
	return xform
		
		
		
		
			
