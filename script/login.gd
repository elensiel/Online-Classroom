extends GUI_position


## NODE REFERENCES
@onready var panel: Panel = $Panel
@onready var user_label: Label = $Panel/UserLabel
@onready var user_input: LineEdit = $Panel/UserInput
@onready var user_warning: Label = $Panel/UserWarning
@onready var pass_label: Label = $Panel/PassLabel
@onready var pass_input: LineEdit = $Panel/PassInput
@onready var pass_warning: Label = $Panel/PassWarning
@onready var login: Button = $Panel/Login
@onready var signup_label: Label = $Panel/SignupLabel
@onready var signup_link: LinkButton = $Panel/SignupLink


## VARIABLES
var can_login := false
var is_valid_email := false
var is_valid_password := false

# PRELOADS
var signup := preload("res://scene/signup.tscn")


## FUNCTIONS
func _ready() -> void:
	super.panel_position_center(panel)
	super.username_position(panel, user_input, user_label, user_warning)
	super.password_position(panel, pass_input, pass_label, pass_warning, user_warning)
	super.login_position(login, pass_warning)
	signup_position()

func signup_position() -> void:
	signup_label.position.x = login.position.x
	signup_label.position.y = login.position.y + login.size.y + 5
	signup_link.position.x = signup_label.position.x + signup_label.size.x + 5
	signup_link.position.y = signup_label.position.y

func check_can_login() -> void:
	if is_valid_email and is_valid_password:
		login.disabled = false
	else:
		login.disabled = true


## SIGNALS
func _on_signup_link_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/signup.tscn")

func _on_user_input_text_changed(new_text: String) -> void:
	if not new_text.contains("@") or not new_text.contains(".com"):
		is_valid_email = false
		user_warning.text = " Must contain '@example.com'"
		user_warning.add_theme_color_override("font_color", Color.YELLOW)
	else:
		is_valid_email = true
		user_warning.text = " Valid"
		user_warning.add_theme_color_override("font_color", Color.GREEN)
	
	check_can_login()

func _on_pass_input_text_changed(new_text: String) -> void:
	if new_text.length() >= 8:
		is_valid_password = true
		pass_warning.text = " Valid"
		pass_warning.add_theme_color_override("font_color", Color.GREEN)
	else:
		is_valid_password = false
		pass_warning.text = " Password does not match"
		pass_warning.add_theme_color_override("font_color", Color.YELLOW)
	
	check_can_login()
