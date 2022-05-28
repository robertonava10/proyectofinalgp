extends RigidBody2D

export (int) var velocidadminima
export (int) var velocidadmaxima
var tipo_enemy = ["enemy","minienemy"]

func _ready():
	$AnimatedSprite.animation = tipo_enemy [randi()%tipo_enemy.size()]
	
	if $AnimatedSprite.animation == "enemy":
		$CollisionShape2D.scale.x = 1.4
		$CollisionShape2D.scale.y = 1.4
		

func _on_VisibilityNotifier2D_screen_exited():
	pass 
