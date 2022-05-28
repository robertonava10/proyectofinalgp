extends Node2D

export (PackedScene) var Enemy 
var Score

func _ready():
	randomize()
	
func new_game():
	Score = 0
	$monitoplayer.inicio($PosicionInicio.position)
	$StartTimer.start()
	$Interfaz.mostrarmensaje("Get ready.......")
	$Interfaz.newpoints(Score)
	$MusicadeFONDO.play()


func gameover():
	$PointTimer.stop()
	$EnemyTimer.stop()
	$Interfaz.gameover()
	$gameoversound.play()
	$MusicadeFONDO.stop()


func _on_StartTimer_timeout():
	$EnemyTimer.start()
	$PointTimer.start()


func _on_PointTimer_timeout():
	Score += 1
	$Interfaz.newpoints(Score)

func _on_EnemyTimer_timeout():
	$Camino/EnemyPosicion.set_offset(randi())
	var E = Enemy.instance() 
	add_child(E)
	
	var direccion = $Camino/EnemyPosicion.rotation + PI /2
	E.position = $Camino/EnemyPosicion.position
	
	direccion += rand_range(-PI /4,PI /4)
	E.rotation = direccion
	E.set_linear_velocity(Vector2(rand_range(E.velocidadminima,E.velocidadmaxima),0).rotated(direccion))



