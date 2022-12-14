import wollok.game.*
import map.*
import sound.*
import screen.*
import pokemon.*

//Personaje Principal
object red {

	var property position = game.at(32, 1) // Posiciono el pj en el centro
	var property lastPosition //ultima posicion de red
	var property image = "red/back2.png" // Establezco una imagen para el personaje
	var countSteps = 1	// Contadores para cada movimiento (derecha, izquierda, arriba y abajo)	
	var property grassSteps = 0 //Contador para cada paso en el cesped
	var property randomSteps = 10.randomUpTo(40).truncate(0) //Valor random del 10 al 40 para matchear con grassSteps
	var property myPokemons = [charmander]

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
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.right(1)
		image = "red/right" + countSteps + ".png"
	}

	//Configura el movimiento hacia la izquierda y la imagen 1, 2 o 3 con el contador de pasos 
	method setLeft() {
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.left(1)
		image = "red/left" + countSteps + ".png"
	}

	//Configura el movimiento hacia arriba y la imagen 1, 2 o 3 con el contador de pasos 
	method setUp() {
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)
		position = position.up(1)
		image = "red/back" + countSteps + ".png"
	}

	//Configura el movimiento hacia abajo y la imagen 1, 2 o 3 con el contador de pasos 
	method setDown() {
		//seteamos ultima posicion antes del movimiento
		self.lastPosition(position)			
		position = position.down(1)
		image = "red/front" + countSteps + ".png"
	}
	
	//instacio las coliciones contra los objetos del mapa
	method instanceColliders(){
		game.onCollideDo(self,{hitBox => hitBox.collidWithCharacter()})
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
	/*
	 * Suma 1 paso (en el pasto a red) cuando matchea con la variable randomSteps (variable random que puede
	 * tener valores de 10 a 40), realiza un cambio de escena.
	 * 
	 */
	method stepOnGrass(){
		grassSteps += 1
		
		if(grassSteps == self.randomSteps()){
			self.newRandom()
			game.clear()
			grassSteps = 0
			self.fight().pickImage()
			battleScreen.addConfigurations()
		}
	}
	method sayPokemonOrPokemons(cantPokemons){
		if (cantPokemons == 1){
			return "pokemon"
		}else{
			return "pokemons"
		}
	}
	method saySizePokemons(){
		const cantPokemons = map1.mapPokemons().size()
		
		game.say(self,"segun mis calculos...")
		game.say(self,"quedan "+cantPokemons.toString()+" "+self.sayPokemonOrPokemons(cantPokemons))
	}	
	
	method setCount(){
		if(countSteps == 4){
			countSteps = 1			
		}
	}
	method newRandom(){
		self.randomSteps(10.randomUpTo(40).truncate(0))
	}
	
	method fight(){
		return self.myPokemons().anyOne()
	}
}