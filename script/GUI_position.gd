extends Control
class_name GUI_position

## FUNCTIONS
# UI POSITIONING FUNCTIONS
func panel_position_center(panel : Panel) -> void:
	panel.position.x = (get_viewport_rect().size.x / 2) - (panel.size.x / 2)
	panel.position.y = (get_viewport_rect().size.y / 2) - (panel.size.y / 2)

func panel_position_right(panel : Panel) -> void:
	panel.position.x = ((get_viewport_rect().size.x / 2) / 2 * 3) - (panel.size.x / 2)
	panel.position.y = get_viewport_rect().size.y / 2 - (panel.size.y / 2)

func panel_position_left(panel : Panel) -> void:
	panel.position.x = ((get_viewport_rect().size.x / 2) / 2) - (panel.size.x / 2)
	panel.position.y = get_viewport_rect().size.y / 2 - (panel.size.y / 2)

func username_position(panel : Panel, input : LineEdit, label : Label, warning : Label) -> void:
	input.position.x = (panel.size.x / 3) - (input.size.x / 2)
	input.position.y = (panel.size.y / 3) - (input.size.y / 2)

	label.position.x = input.position.x
	label.position.y = input.position.y - label.size.y

	warning.position.x = input.position.x
	warning.position.y = input.position.y + input.size.y

func password_position(panel : Panel, input : LineEdit, label : Label, warning : Label, user_warning : Label) -> void:
	label.position.x = user_warning.position.x
	label.position.y = user_warning.position.y + (user_warning.size.y * 2)
	
	input.position.x = label.position.x
	input.position.y = label.position.y + (label.size.y)

	warning.position.x = input.position.x
	warning.position.y = input.position.y + input.size.y

func login_position(button : Button, password_warning : Label) -> void:
	button.position.x = password_warning.position.x
	button.position.y = password_warning.position.y + (password_warning.size.y * 2)

func back_position(button : Button, login_button : Button) -> void:
	button.position.x = login_button.position.x + (login_button.size.x + (login_button.size.x / 8))
	button.position.y = login_button.position.y + (login_button.size.y - button.size.y)
