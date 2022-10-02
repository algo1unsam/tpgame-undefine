import wollok.game.*
import red.*
import screen.*
import sound.*

//Map tiene mucha relación con screen, pueda que cualquier cambio haya que reflejarlo en screen

class Map {	
	const property image
	const listOfNormalColliders = []
	const listOfColliderGrass = []
	/*crea una bloque o linea de objetos invisibles con posiciones desde initX hasta EndX-1(desde izqquierda a derecha eje x)
	  y desde intitY hasta endY-1 (desde abajo hacia arriba ejeY)
	 ej: metohd createLineOfCollidersInX(initX=1,endx=10,initY=0,endY=2)
	 	 va a inicializar un boque de objetos invisibles con las siguientes posiciones
	 	 (1,0), (2.0),(3,0)(4,0),(5,0),(6,0),(7,0),(8,0),(9,0)
	 	 (1,1), (2.1),(3,1)(4,1),(5,1),(6,1),(7,1),(8,1),(9,1)*/
	method createBloqueOfTheColliders(initX,endX,initY,endY){
		(initY-endY).times{countY => (endX-initX).times{countX => self.instanceColliders(initX+(countX-1),initY+(countY-1))}}
	}
	//instancia colliders genericos contra los que choca
	method instanceColliders(x,y){
		listOfNormalColliders.add(new Colliders(position=game.at(x,y))) 
	}
	//temporal 
	method createBloqueOfTheCollidersGrass(initX,endX,initY,endY){
		(initY-endY).times{countY => (endX-initX).times{countX => self.instanceCollidersGrass(initX+(countX-1),initY+(countY-1))}}
	}
	//instancia colliders de pasto
	method instanceCollidersGrass(x,y){
		listOfNormalColliders.add(new ColidersGrass(position=game.at(x,y))) 
	}
}

class Colliders{
	var property position	// Posiciono los objetos para que colisionen
	//var property image = "red/ash3.jpg" // Establezco una imagen para el personaje
	
	method showInBoard(){
		game.addVisual(self)
	}
	method collidWithCharacter(){
		game.onCollideDo(self, { el => el.collidWithBlock()})
	}
}

class ColidersGrass inherits Colliders   {
	//var property image = "red/ash3.jpg" // Establezco una imagen para el personaje
	
	/*
	 * Suma 1 paso (en el pasto a red) cuando matchea con la variable randomSteps (variable random que puede
	 * tener valores de 10 a 40), realiza un cambio de escena.
	 * 
	 */
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
const map1 = new Map (image = "maps/map1.jpg")
const battle = new Map (image = "maps/battle.jpg")

//PRUEBA COLIDERS

const collider1 = new Colliders(position = game.at(30, 20))
const collider2 = new Colliders(position = game.at(31, 20))
const collider3 = new Colliders(position = game.at(32, 20))
const grass1 = new ColidersGrass(position = game.at (30,10))
const grass2 = new ColidersGrass(position = game.at (31,10))
const grass3 = new ColidersGrass(position = game.at (32,10))
const grass4 = new ColidersGrass(position = game.at (33,10))
const grass5 = new ColidersGrass(position = game.at (34,10))
const grass6 = new ColidersGrass(position = game.at (35,10))
const grass7 = new ColidersGrass(position = game.at (30,11))
const grass8 = new ColidersGrass(position = game.at (31,11))
const grass9 = new ColidersGrass(position = game.at (32,11))
const grass10 = new ColidersGrass(position = game.at (33,11))
const grass11 = new ColidersGrass(position = game.at (34,11))
const grass12 = new ColidersGrass(position = game.at (35,11))



