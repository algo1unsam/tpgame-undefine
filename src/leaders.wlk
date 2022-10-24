import wollok.game.*
import pokemon.*

class Leader{
	var property position
	var property image
	var property myPokemon
}


//Ojo cambiar a .png cuando cambiamos la imagen
const leon = new Leader(position = game.at(26, 17), image = "red/back2.png", myPokemon = magmar)
const alete = new Leader(position = game.at(40, 20), image = "red/back2.png", myPokemon = scyther)
const lucas = new Leader(position = game.at(33, 32), image = "red/back2.png", myPokemon = gyarados)



