extends Node3D

@export var _items : Array[Equipable] = []

var _equippedIndex : int = 0

var _curEquipped : Equipable

func AddItem(equipable : Equipable):
	_items.push_back(equipable)

func RemoveItemAtIndex(index : int):
	#Validate index
	if !ValidateIndex(index):
		pass
	#Remove
	_items.remove_at(index)
	
func RemoveItem(item : Equipable):
	#Find equipable
	var index : int = _items.find(item)
	#remove
	_items.remove_at(index)

func EquipItem(index : int):
	#Validate index
	if _curEquipped != null:
		_curEquipped.OnUnequip()
		_curEquipped = null
	if ValidateIndex(index):
		_curEquipped = _items[index]
		_curEquipped.OnEquip()
	
	
func ValidateIndex(index : int) -> bool:
	
	return index > 0 && index < _items.size()
