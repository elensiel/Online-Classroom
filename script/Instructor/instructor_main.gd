extends Control


## NODE REFERENCES
@onready var side_panel: Panel = $SidePanel
@onready var top_panel: Panel = $TopPanel
@onready var home_button: Button = $SidePanel/Home
@onready var profile_button: MenuButton = $TopPanel/ProfileButton
@onready var settings_button: Button = $SidePanel/Settings
@onready var classes_button: Button = $SidePanel/Classes
@onready var create_button: Button = $TopPanel/CreateButton
@onready var classroom: LinkButton = $TopPanel/Classroom


## FUNCTIONS
func _ready() -> void:
	top_panel_comp()
	classroom_comp()
	profile_bar_comp()
	add_bar_comp()
	side_panel_comp()
	home_button_comp()
	enrolled_button_comp()
	settings_button_comp()

# TOP PANEL
func top_panel_comp() -> void:
	top_panel.size.x = get_viewport_rect().size.x
	top_panel.size.y = get_viewport_rect().size.y / 10

func classroom_comp() -> void:
	classroom.position.x = 20
	classroom.position.y = top_panel.size.y / 5

func profile_bar_comp() -> void:
	profile_button.size.x = top_panel.size.x / 10
	profile_button.size.y = top_panel.size.y / 6
	
	profile_button.position.x = top_panel.size.length() - profile_button.size.x - 15
	profile_button.position.y = top_panel.size.y / 2 - (profile_button.size.y / 2)

func add_bar_comp() -> void:
	create_button.size.x = top_panel.size.x / 16
	create_button.size.y = top_panel.size.y / 6
	
	create_button.position.x = profile_button.position.x - profile_button.size.x / 2
	create_button.position.y = top_panel.size.y / 2 - create_button.size.y / 2

# SIDE PANEL
func side_panel_comp() -> void:
	side_panel.size.x = get_viewport_rect().size.x / 5
	side_panel.size.y = get_viewport_rect().size.y - top_panel.size.y
	side_panel.position.y = top_panel.size.y

func home_button_comp() -> void:
	home_button.size.x = side_panel.size.x - 30
	home_button.position.x = 15
	
	home_button.size.y = 80
	home_button.position.y = 15

func enrolled_button_comp() -> void:
	classes_button.size.x = side_panel.size.x - 30
	classes_button.position.x = home_button.position.x
	
	classes_button.size.y = 80
	classes_button.position.y = home_button.position.y + home_button.size.y + 15

func settings_button_comp() -> void:
	settings_button.size.x = side_panel.size.x - 30
	settings_button.size.y = 80
	
	settings_button.position.x = home_button.position.x
	settings_button.position.y = side_panel.size.y - 15 - settings_button.size.y
