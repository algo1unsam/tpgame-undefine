import wollok.game.*

//Objeto con las canciones del juego, cada metodo retorna la cancion con su configuracion
class SongsPokemon {
	const song
	
	method playSound(){
		song.shouldLoop(true)	//Suena la cancion con un loop
		game.schedule(100, { song.play()}) //Toca la cancion y al finalizar la reprograma en 100 ms
	}
	
	method stopSound(){
		song.stop()
	}
}

const route1 = new SongsPokemon(song = game.sound("sounds/route1.mp3"))
const soundBattle = new SongsPokemon(song = game.sound("sounds/battle.mp3"))