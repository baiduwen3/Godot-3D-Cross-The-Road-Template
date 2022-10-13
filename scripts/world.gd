extends Spatial

onready var plyr =  $player
onready var test_pos = $positions/test_position

export var testing = false


func _ready():
	if testing == false:
		plyr.global_transform.origin = $positions/initial_position.global_transform.origin
	else:
		plyr.global_transform.origin = test_pos.global_transform.origin
