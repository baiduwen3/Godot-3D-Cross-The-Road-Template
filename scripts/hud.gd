extends Control
var time = 0
var minutes
var seconds = 0

var subscore1 = 0
var subscore2 = 0
var score = 0

onready var min_val_label = $MarginContainer/VBoxContainer/HBoxContainer2/min_value
onready var sec_val_label = $MarginContainer/VBoxContainer/HBoxContainer2/sec_value

onready var score_val_label = $MarginContainer/VBoxContainer/HBoxContainer/score_value

func _ready():
	pass


func _on_time_timer_timeout():
	time += 1
	
	minutes = time / 60
	seconds = time % 60
	
	print(time, " counter")
	print(minutes, " min")
	print(seconds, " sec")
	
	min_val_label.text = str(minutes)
	sec_val_label.text = str(seconds)

	

func _on_objects_in_container():
	if time <= 20:
		subscore1 = 100
	if time >20 and time <=25:
		subscore1 = 50 
	if time >25 and time <=40:
		subscore1 = 25
	if time >40:
		subscore1 = 5
	
	score = score + subscore1
	score_val_label.text = str(score)

func _on_objects_in_container2():
	if time <= 20:
		subscore2 = 100
	if time >20 and time <=25:
		subscore2 = 50 
	if time >25 and time <=40:
		subscore2 = 25
	if time >40:
		subscore2 = 5
	
	score = score + subscore2
	score_val_label.text = str(score)
