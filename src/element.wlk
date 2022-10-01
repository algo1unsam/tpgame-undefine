import wollok.game.*

object pokeball {}

//Recuṕera vida del pokemon
object potion{
	
	method use(){
		return 10
	}
}

class Colliders{
	var property position	// Posiciono los objetos para que colisionen
	//var property image = "red/ash3.jpg" // Establezco una imagen para el personaje
}

const collider1 = new Colliders(position = game.at(30, 20))
const collider2 = new Colliders(position = game.at(31, 20))
const collider3 = new Colliders(position = game.at(32, 20))
