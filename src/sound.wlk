import wollok.game.*

//Objeto con las canciones del juego, cada metodo retorna la cancion con su configuracion
object songsPokemon {
	
	method route1Sound(){
		const route1 = game.sound("sounds/route1.mp3")
		route1.shouldLoop(true)	//Suena la cancion con un loop
		game.schedule(100, { route1.play()}) //Toca la cancion y al finalizar la reprograma en 100 ms
	}
}
