extends GUI_position

## NODE REFERENCES
@onready var panel: Panel = $Panel
@onready var email_label: Label = $Panel/EmailLabel
@onready var email_input: LineEdit = $Panel/EmailInput
@onready var email_warning: Label = $Panel/EmailWarning
@onready var pass_label: Label = $Panel/PassLabel
@onready var pass_input: LineEdit = $Panel/PassInput
@onready var pass_warning: Label = $Panel/PassWarning
@onready var confirm_pass_label: Label = $Panel/ConfirmPassLabel
@onready var confirm_pass_input: LineEdit = $Panel/ConfirmPassInput
@onready var confirm_pass_warning: Label = $Panel/ConfirmPassWarning
@onready var type_label: Label = $Panel/TypeLabel
@onready var type_option: OptionButton = $Panel/TypeOption
@onready var first_name_label: Label = $Panel/FirstNameLabel
@onready var first_name_input: LineEdit = $Panel/FirstNameInput
@onready var first_name_warning: Label = $Panel/FirstNameWarning
@onready var last_name_label: Label = $Panel/LastNameLabel
@onready var last_name_input: LineEdit = $Panel/LastNameInput
@onready var last_name_warning: Label = $Panel/LastNameWarning
@onready var signin_button: Button = $Panel/SigninButton
@onready var login_label: Label = $Panel/LoginLabel
@onready var login_link: LinkButton = $Panel/LoginLink

## VARIABLES
var can_signin := false
var is_valid_first_name := false
var is_valid_last_name := false
var is_valid_email := false
var is_valid_password := false
var is_valid_password_confirm := false
var type_selected := false

## FUNCTIONS
func _ready() -> void:
	super.panel_position_center(panel)
	name_position()
	email_position()
	super.password_position(panel, pass_input, pass_label, pass_warning, email_warning)
	super.password_position(panel, confirm_pass_input, confirm_pass_label, confirm_pass_warning, pass_warning)
	type_position()
	button_position()

# GUI POSITIONS
func name_position() -> void:
	first_name_input.position.x = (panel.size.x / 4) - (first_name_input.size.x / 2)
	first_name_input.position.y = (panel.size.y / 8) - (first_name_input.size.y / 2)

	first_name_label.position.x = first_name_input.position.x
	first_name_label.position.y = first_name_input.position.y - first_name_label.size.y

	first_name_warning.position.x = first_name_input.position.x
	first_name_warning.position.y = first_name_input.position.y + first_name_input.size.y
	
	last_name_input.position.x = first_name_input.position.x + (first_name_input.size.x + 20)
	last_name_input.position.y = first_name_input.position.y
	
	last_name_label.position.x = last_name_input.position.x
	last_name_label.position.y = first_name_label.position.y
	
	last_name_warning.position.x = last_name_input.position.x
	last_name_warning.position.y = last_name_input.position.y + last_name_input.size.y

func email_position() -> void:
	email_input.position.x = first_name_warning.position.x
	email_input.position.y = first_name_warning.position.y + (first_name_warning.size.y * 2)

	email_label.position.x = email_input.position.x
	email_label.position.y = email_input.position.y - email_label.size.y

	email_warning.position.x = email_input.position.x
	email_warning.position.y = email_input.position.y + email_input.size.y

func type_position() -> void:
	type_label.position.x = confirm_pass_warning.position.x
	type_label.position.y = confirm_pass_warning.position.y + (confirm_pass_warning.size.y * 2)
	
	type_option.position.x = type_label.position.x
	type_option.position.y = type_label.position.y + confirm_pass_warning.size.y
	
func button_position() -> void:
	signin_button.position.x = type_option.position.x
	signin_button.position.y = type_option.position.y + (type_option.size.y * 2)
	
	login_label.position.x = signin_button.position.x
	login_label.position.y = signin_button.position.y + signin_button.size.y + 5
	
	login_link.position.x = login_label.position.x + login_label.size.x
	login_link.position.y = login_label.position.y

## CHECK TO ENABLE SIGN IN BUTTON
func check_can_signin() -> void:
	if is_valid_email and is_valid_password and is_valid_password_confirm and is_valid_first_name and is_valid_last_name and type_selected:
		can_signin = true
	
	if can_signin:
		signin_button.disabled = false
	else:
		signin_button.disabled = true

## SIGNALS
# INPUT CHANGES
func _on_email_input_text_changed(new_text: String) -> void:
	if not new_text.contains("@") or not new_text.contains(".com"):
		is_valid_email = false
		email_warning.text = " Must contain 'example@email.com'"
		email_warning.add_theme_color_override("font_color", Color.YELLOW)
	else:
		is_valid_email = true
		email_warning.text = " Valid"
		email_warning.add_theme_color_override("font_color", Color.GREEN)
	
	check_can_signin()

func _on_pass_input_text_changed(new_text: String) -> void:
	if new_text.length() >= 8:
		is_valid_password = true
		pass_warning.text = " Valid"
		pass_warning.add_theme_color_override("font_color", Color.GREEN)
	else:
		is_valid_password = false
		pass_warning.text = " Password must be at least 8 characters long"
		pass_warning.add_theme_color_override("font_color", Color.YELLOW)
	
	if new_text != confirm_pass_input.text and not confirm_pass_input.text == "":
		is_valid_password_confirm = false
		confirm_pass_warning.text =  " Passwords must match in both fields"
		confirm_pass_warning.add_theme_color_override("font_color", Color.YELLOW)
	elif confirm_pass_input.text.length() == 0:
		is_valid_password_confirm = false
		confirm_pass_warning.text = ""
	else:
		is_valid_password_confirm = true
		confirm_pass_warning.text =  " Matched!"
		confirm_pass_warning.add_theme_color_override("font_color", Color.GREEN)
	
	check_can_signin()

func _on_confirm_pass_input_text_changed(new_text: String) -> void:
	if new_text != pass_input.text:
		is_valid_password_confirm = false
		confirm_pass_warning.text =  " Passwords must match in both fields"
		confirm_pass_warning.add_theme_color_override("font_color", Color.YELLOW)
	elif new_text.length() == 0:
		is_valid_password_confirm = false
		confirm_pass_warning.text = ""
	else:
		is_valid_password_confirm = true
		confirm_pass_warning.text =  " Matched!"
		confirm_pass_warning.add_theme_color_override("font_color", Color.GREEN)
	
	check_can_signin()

func _on_first_name_input_focus_exited() -> void:
	if first_name_input.text.length() != 0:
		is_valid_first_name = true
		first_name_warning.text = ""
	else:
		is_valid_first_name = false
		first_name_warning.text = " Cannot leave blank"
	
	check_can_signin()

func _on_last_name_input_focus_exited() -> void:
	if last_name_input.text.length() != 0:
		is_valid_last_name = true
		last_name_warning.text = ""
	else:
		is_valid_last_name = false
		last_name_warning.text = " Cannot leave blank"
	
	check_can_signin()

func _on_type_option_item_selected(index: int) -> void:
	if index > -1:
		type_selected = true
	
	check_can_signin()

# BUTTON EVENTS
func _on_login_link_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/login.tscn")
