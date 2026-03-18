class_name  Objective

extends Node

signal OnObjectiveComplete()

@export var _objectiveMessage : String

var _objectiveComplete : bool

func ObjectiveComplete():
	_objectiveComplete = true
	OnObjectiveComplete.emit()
