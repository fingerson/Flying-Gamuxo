extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label.text = str(points)
	$Limites.connect("body_entered",self,"_on_body_entered_pillar")
	for child in $Pilares.get_children():
		child.connect("body_entered",self,"_on_body_entered_pillar")
		child.connect("point",self,"point")
	pass # Replace with function body.

func _on_body_entered_pillar(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Level.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Limites.position.x = $Gamuxo.position.x
	pass

func point():
	points+=1
	$CanvasLayer/Label.text = str(points)
	pass