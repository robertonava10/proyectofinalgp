extends CanvasLayer


signal startgame

func mostrarmensaje(mensajebienvenida):
	$Mensaje.text = mensajebienvenida
	$Mensaje.show()
	$MensajeTimer.start()
	
func gameover():
	mostrarmensaje(" G A M E  O V E R")
	yield($MensajeTimer, "timeout")
	$Button.show()
	$Mensaje.text = "FINAL SEASON"
	$Mensaje.show()
	
func newpoints(Puntos):
	$PointsLabel.text = str(Puntos)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("startgame")
	
