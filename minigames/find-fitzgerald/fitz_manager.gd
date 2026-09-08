extends Node

@export var levels : Array[Node2D] = []

var level_index := 0

func _ready() -> void:
	for level in levels:
		level.hide()
	for fitz in get_tree().get_nodes_in_group("fitz"):
		@warning_ignore("unsafe_property_access", "unsafe_method_access")
		fitz.clicked.connect(_on_fitz_clicked)
	levels[level_index].show()


func _on_fitz_clicked():
	level_index += 1
	if level_index >= levels.size():
		CurrentGame.win()
	else:
		levels[level_index -1].hide()
		levels[level_index].show()
