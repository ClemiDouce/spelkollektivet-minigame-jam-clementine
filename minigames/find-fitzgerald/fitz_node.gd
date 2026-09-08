extends Node2D

signal clicked

@onready var click_detection: Area2D = $ClickDetection
@export var frog_sound : AudioStreamPlayer

var is_hovered := false: set = _set_is_hovered

var base_scale := Vector2.ONE
var hover_scale := Vector2.ONE

func _ready():
	click_detection.area_entered.connect(func(_area): is_hovered = true)
	click_detection.area_exited.connect(func(_area): is_hovered = false)
	base_scale = scale
	hover_scale = base_scale * 1.5

func _set_is_hovered(value: bool):
	is_hovered = value
	scale = base_scale if value == false else hover_scale

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT and is_hovered:
			frog_sound.play()
			clicked.emit()
