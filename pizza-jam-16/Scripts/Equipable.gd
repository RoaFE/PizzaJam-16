@abstract

class_name Equipable
extends Node3D

signal ToolEquipped()


var _active : bool
var _equipped : bool

	
func OnEquip():
	_equipped = true;
	ToolEquipped.emit()

func OnUnequip():
	_equipped = false;
