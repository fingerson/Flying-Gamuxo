extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var h_speed = 150
export(int) var gravity = 800
export(int) var jump_speed = 300 
var velocity = Vector2(h_speed,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered",self,"_on_area_entered")
	add_to_group("Player")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity*delta
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump_speed
	$Sprite.rotation = velocity.angle()
	move_and_slide(velocity)
	pass

func _on_area_entered(area):
	if area.is_in_group("Pillar"):
		area.renew()