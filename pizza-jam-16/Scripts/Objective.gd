class_name  Objective

extends Node

signal OnObjectiveComplete()

@export var _objectiveMessage : String

var _objectiveComplete : int = 0

func ObjectiveComplete():
	_objectiveComplete += 1
	OnObjectiveComplete.emit()
