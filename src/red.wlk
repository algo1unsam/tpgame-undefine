import wollok.game.*
import map.*

//Personaje Principal
object red {

	var property position = game.at(32, 0) // Posiciono el pj en el centro
	var property image = "red/back2.jpg" // Establezco una imagen para el personaje
	var countSteps = 1	// Contadores para cada movimiento (derecha, izquierda, arriba y abajo)	
	var property grassSteps = 0 //Contador para cada paso en el cesped
	var property randomSteps = 10.randomUpTo(40).truncate(0) //Valor random del 10 al 40 para matchear con grassSteps

	/*
	 * Para que Red se mueva con las arrows (params => 0, se mueve menos que en 1, el movimiento es mas suave)
	 * Cada metodo de movimiento tiene un contador para que vaya cambiando la imagen emulando una caminata
	 * A la imagen le sume el +countSteps para emular el 1, 2 o 3 que la imagen lo tomo como la misma ruta y asi  
	 */
	method right() {
		self.setRight()
		self.setSteps()
		self.setCount()
	}

	method left() {
		self.setLeft()
		self.setSteps()
		self.setCount()
	}

	method up() {
		self.setUp()
		self.setSteps()
		self.setCount()
	}

	method down() {
		self.setDown()
		self.setSteps()
		self.setCount()
	}

	//Configura los pasos con un contador de pasos para elegir entre la imagen 1, 2 o 3 
	//Le sumo los pasos solo a setSteps para no repetir codigo
	method setSteps() {
		const step = game.sound("sounds/step" + countSteps + ".mp3")
		countSteps += 1
		step.volume(0.5)
		step.play()
	}

	//Configura el movimiento hacia la derecha y la imagen 1, 2 o 3 con el contador de pasos 
	method setRight() {
		position = position.right(0)
		image = "red/right" + countSteps + ".png"
	}

	//Configura el movimiento hacia la izquierda y la imagen 1, 2 o 3 con el contador de pasos 
	method setLeft() {
		position = position.left(0)
		image = "red/left" + countSteps + ".jpg"
	}

	//Configura el movimiento hacia arriba y la imagen 1, 2 o 3 con el contador de pasos 
	method setUp() {
		position = position.up(0)
		image = "red/back" + countSteps + ".jpg"
	}

	//Configura el movimiento hacia abajo y la imagen 1, 2 o 3 con el contador de pasos 
	method setDown() {
		position = position.down(0)
		image = "red/front" + countSteps + ".png"
	}
	
	//Rebota cuando colisiona con un objeto
	method rebound() {
		position = position.down(1)
		//image = "assets/front1.jpg"
	}
	
	method setCount(){
		if(countSteps == 4){
			countSteps = 1			
		}
	}
	
	method newRandom(){
		self.randomSteps(10.randomUpTo(40).truncate(0))
	}
}