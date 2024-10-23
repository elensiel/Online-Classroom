extends Panel

@onready var home: Button = $Home
@onready var classes: Button = $Classes
@onready var settings: Button = $Settings

func _on_home_toggled(toggled_on: bool) -> void:
	if toggled_on:
		home.button_pressed = true
		classes.button_pressed = false
		settings.button_pressed = false

func _on_classes_toggled(toggled_on: bool) -> void:
	if toggled_on:
		home.button_pressed = false
		settings.button_pressed = false

func _on_settings_toggled(toggled_on: bool) -> void:
	if toggled_on:
		home.button_pressed = false
		classes.button_pressed = false
