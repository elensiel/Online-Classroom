extends Control


## NODE REFERENCES
@onready var side_panel: Panel = $SidePanel
@onready var top_panel: Panel = $TopPanel
@onready var home_button: Button = $SidePanel/Home
@onready var enrolled_button: Button = $SidePanel/Enrolled
@onready var classroom: Label = $TopPanel/Classroom
@onready var profile_button: MenuButton = $TopPanel/ProfileButton
@onready var join_button: Button = $TopPanel/JoinButton


## FUNCTIONS
func _ready() -> void:
	top_panel_comp()
	classroom_comp()
	profile_bar_comp()
	add_bar_comp()
	side_panel_comp()
	home_button_comp()
	enrolled_button_comp()

# GUI COMPOSITIONS
# TOP PANEL
func top_panel_comp() -> void:
	top_panel.size.x = get_viewport_rect().size.x
	top_panel.size.y = get_viewport_rect().size.y / 10

func classroom_comp() -> void:
	classroom.size.x = side_panel.size.x
	classroom.size.y = top_panel.size.y
	
	classroom.position.x = classroom.size.x / 6

func profile_bar_comp() -> void:
	profile_button.size.x = top_panel.size.x / 10
	profile_button.size.y = top_panel.size.y / 6
	
	profile_button.position.x = top_panel.size.length() - profile_button.size.x - 15
	profile_button.position.y = top_panel.size.y / 2 - (profile_button.size.y / 2)

func add_bar_comp() -> void:
	join_button.size.x = top_panel.size.x / 16
	join_button.size.y = top_panel.size.y / 6
	
	join_button.position.x = profile_button.position.x - profile_button.size.x / 2
	join_button.position.y = top_panel.size.y / 2 - join_button.size.y / 2

# SIDE PANEL
func side_panel_comp() -> void:
	side_panel.size.x = get_viewport_rect().size.x / 4
	side_panel.size.y = get_viewport_rect().size.y - top_panel.size.y
	side_panel.position.y = top_panel.size.y

func home_button_comp() -> void:
	home_button.size.x = side_panel.size.x - 30
	home_button.position.x = 15
	
	home_button.size.y = 80
	home_button.position.y = 15

func enrolled_button_comp() -> void:
	enrolled_button.size.x = side_panel.size.x - 30
	enrolled_button.position.x = home_button.position.x
	
	enrolled_button.size.y = 80
	enrolled_button.position.y = home_button.position.y + home_button.size.y + 15


## SIGNALS
func _on_home_toggled(toggled_on: bool) -> void:
	if toggled_on:
		enrolled_button.button_pressed = false

func _on_enrolled_toggled(toggled_on: bool) -> void:
	if toggled_on:
		home_button.button_pressed = false
