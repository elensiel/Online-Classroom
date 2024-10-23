extends Panel

@onready var profile_button: MenuButton = $ProfileButton
@onready var home: Button = $"../SidePanel/Home"

func _ready() -> void:
	profile_button.get_popup().id_pressed.connect(get_id)

func get_id(item : int) -> void:
	if item == 0:
		pass
	elif item == 1:
		get_tree().change_scene_to_file("res://scene/login.tscn")
