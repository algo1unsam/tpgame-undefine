import wollok.game.*
import red.*
import screen.*
import sound.*

//Map tiene mucha relación con screen, pueda que cualquier cambio haya que reflejarlo en screen

class Map {	
	const property image
}

class Colliders{
	var property position	// Posiciono los objetos para que colisionen
	//var property image = "red/ash3.jpg" // Establezco una imagen para el personaje
}

class ColidersGrass{
	var property position	// Posiciono los objetos para que colisionen
	//var property image = "red/ash3.jpg" // Establezco una imagen para el personaje
	
	/*
	 * Suma 1 paso (en el pasto a red) cuando matchea con la variable randomSteps (variable random que puede
	 * tener valores de 10 a 40), realiza un cambio de escena.
	 * 
	 */
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



