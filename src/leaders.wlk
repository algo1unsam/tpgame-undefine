import wollok.game.*
import pokemon.*

class Leader{
	var property position
	var property image
}


//Ojo cambiar a .png cuando cambiamos la imagen
const leon = new Leader(position = game.at(26, 17), image = "trainerImages/leon.png")
const alete = new Leader(position = game.at(40, 20), image = "trainerImages/alete.png")
const lucas = new Leader(position = game.at(33, 32), image = "trainerImages/lucas.png")



