import wollok.game.*
import red.*
import screen.*
import sound.*

//Map tiene mucha relación con screen, pueda que cualquier cambio haya que reflejarlo en screen


//mapa inicial 
//TODO: hacer refactor a las funciones para no repetir tanto codigo
class InitialMap{	
	const property image  //imagen del mapa
	const listOfNormalColliders = []
	const listOfColliderGrass = []
	/*crea una bloque o linea de objetos invisibles con posiciones desde [initX,endX)(desde izqquierda a derecha eje x)
	  y [initY,endY) (desde arriba hacia abajo ejeY)
	 ej: metohd createLineOfCollidersInX(initX=1,endx=10,initY=2,endY=0)
	 	 va a inicializar un boque de objetos invisibles con las siguientes posiciones
	 	 (1,2), (2.2),(3,2)(4,2),(5,2),(6,2),(7,2),(8,2),(9,2)
	 	 (1,1), (2.1),(3,1)(4,1),(5,1),(6,1),(7,1),(8,1),(9,1)*/
	method createBloqueOfTheNormalsObjects(initX,endX,initY,endY){
		(initY-endY).times{countY => (endX-initX).times{countX => self.instanceNormalObject(initX+(countX-1),initY-(countY-1))}}
	}
	//instancia colliders genericos contra los que choca
	method instanceNormalObject(x,y){
		listOfNormalColliders.add(new Colliders(position=game.at(x,y)))
	}
	//temporal 
	method createBloqueOfTheObjectsGrass(initX,endX,initY,endY){
		(initY-endY).times{countY => (endX-initX).times{countX => self.instanceObjectGrass(initX+(countX-1),initY-(countY-1))}}
	}
	//instancia colliders de pasto
	method instanceObjectGrass(x,y){
		listOfColliderGrass.add(new ColidersGrass(position=game.at(x,y))) 
	}
	//crea los los objetos invisibles en las posisiciones que el mapa requiera
	method constructInvisibleNormalObjects(){
		//Instanciando normalObjects
		self.createBloqueOfTheNormalsObjects(25, 39, 21, 19)
		self.createBloqueOfTheNormalsObjects(4, 9, 21, 19)
		self.createBloqueOfTheNormalsObjects(3,4,34, 1)	
		self.createBloqueOfTheNormalsObjects(4, 30, 2, 1)
		self.createBloqueOfTheNormalsObjects(35, 59, 2, 1)
		self.createBloqueOfTheNormalsObjects(29, 30, 2, -1)
		self.createBloqueOfTheNormalsObjects(35, 36, 2, -1)
		self.createBloqueOfTheNormalsObjects(55, 56, 34, 2)
		self.createBloqueOfTheNormalsObjects(4, 30, 12, 10)
//		//instanicaindo GrassObjects
		self.createBloqueOfTheObjectsGrass(30,44,12,8)
	}
	//agrega los visuales en el mapa
	method addVisualInBoard(){
		listOfNormalColliders.forEach{objects => objects.showInBoard()}
		listOfColliderGrass.forEach{objects => objects.showInBoard()}
	}
	//inicializa la posibilidad de colicionar contra estos objetos instanciados y añadidos al board
	method intialiteColliders(){
		listOfNormalColliders.forEach{objects => objects.collidWithCharacter()}
		listOfColliderGrass.forEach{objects => objects.collidWithCharacter()}	
	}
}


class Colliders{
	var property position	// Posiciono los objetos para que colisionen
	var property image = "red/ash3.jpg" // Establezco una imagen para saber donde esta el objeto noramal que sera invisibile
	
	method showInBoard(){
		game.addVisual(self)
	}
	//TODO: ver si podemos hacer que red se enecarge de saber si esta colicionando contra este objeto (posible solucion a la falla de rendimeinto)
	method collidWithCharacter(){
		game.onCollideDo(self, { el => el.collidWithBlock()})
	}
}

class ColidersGrass inherits Colliders   {
	/*
	 * Suma 1 paso (en el pasto a red) cuando matchea con la variable randomSteps (variable random que puede
	 * tener valores de 10 a 40), realiza un cambio de escena.
	 * 
	 */
	//TODO: ver si podemos hacer que red se enecarge de saber si esta colicionando contra este objeto (posible solucion a la falla de rendimeinto)
	override method collidWithCharacter(){
		game.onCollideDo(self, {el => self.stepOnGrass()})
	}
	method stepOnGrass(){
		const steps = red.grassSteps() + 1
		red.grassSteps(red.grassSteps() + 1)
			
		if(steps == red.randomSteps()){
			red.grassSteps(0)
			red.newRandom()
			route1.stopSound()
			game.clear()
			battleScreen.initialSettingsGame()
			battleScreen.addConfigurations()
			game.start()	
		}
		
		red.grassSteps(steps)
	}
}
//Mapa de presentacion
const map1 = new InitialMap (image = "maps/map1.jpg")
const battle = new InitialMap (image = "maps/gardenBG.png")


