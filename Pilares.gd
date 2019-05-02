extends Area2D

var distance = 350
var min_y = -175
var max_y = 140

signal point();
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.y = randf()*(max_y-min_y)+min_y
	add_to_group("Pillar")
	$PointZone.connect("body_entered",self,"_on_body_entered_point")
	pass # Replace with function body.
func renew():
	position.x += global.n_pillars*distance
	position.y = randf()*(max_y-min_y)+min_y
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_body_entered_point(body):
	if body.is_in_group("Player"):
		emit_signal("point")
	pass