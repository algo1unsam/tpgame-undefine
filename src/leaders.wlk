import wollok.game.*
import pokemon.*

class Leader{
	var property position//game.at(32, 0) // Posiciono el pj en el centro
	var property image//"red/back2.png" // Establezco una imagen para el personaje
	var property myPokemon
}


const leon = new Leader(position = game.at(26, 17), image = "red/ash3.jpg", myPokemon = magmar)//Ojo cambiar a .png cuando cambiamos la imagen
const alete = new Leader(position = game.at(40, 20), image = "red/ash3.jpg", myPokemon = scyther)
const lucas = new Leader(position = game.at(33, 32), image = "red/ash3.jpg", myPokemon = gyarados)




