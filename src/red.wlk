import wollok.game.*
import map.*
import sound.*
import screen.*

//Personaje Principal
object red {

	var property position = game.at(32, 0) // Posiciono el pj en el centro
	var property lastPosition //ultima posicion de red
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
		game.say(self, self.position().toString())
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.right(0)
		image = "red/right" + countSteps + ".png"
	}

	//Configura el movimiento hacia la izquierda y la imagen 1, 2 o 3 con el contador de pasos 
	method setLeft() {
		game.say(self, self.position().toString())
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.left(0)
		image = "red/left" + countSteps + ".png"
	}

	//Configura el movimiento hacia arriba y la imagen 1, 2 o 3 con el contador de pasos 
	method setUp() {
		game.say(self, self.position().toString())
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.up(0)
		image = "red/back" + countSteps + ".png"
	}

	//Configura el movimiento hacia abajo y la imagen 1, 2 o 3 con el contador de pasos 
	method setDown() {
		game.say(self, self.position().toString())
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.down(0)
		image = "red/front" + countSteps + ".png"
	}
	
	//Rebota cuando colisiona con una subida
	method rebound() {
		position = position.down(1)
		//image = "assets/front1.jpg"
	}
	//coliciona contra un bloque y vuelve a la posicion anterior 
	method collidWithHitbox(){
		position = lastPosition
	}
	method instanceColliders(){
		game.onCollideDo(self,{hitBox => hitBox.collidWithCharacter()})
	}
	method stepOnGrass(){
		const steps = self.grassSteps() + 1
		self.grassSteps(self.grassSteps() + 1)
			
		if(steps == self.randomSteps()){
			self.grassSteps(0)
			self.newRandom()
			route1.stopSound()
			game.clear()
			battleScreen.initialSettingsGame()
			battleScreen.addConfigurations()
			game.start()	
		}
		self.grassSteps(steps)
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