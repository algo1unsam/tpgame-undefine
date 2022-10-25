import wollok.game.*

//Objeto con las canciones del juego, cada metodo retorna la cancion con su configuracion
class SongsPokemon {
	const song
	
	method playSound(){
		song.shouldLoop(true)	//Suena la cancion con un loop
		game.schedule(100, { song.play()}) //Toca la cancion y al finalizar la reprograma en 100 ms
	}
	
	method pauseSound(){
		song.pause()
	}
	
	method resumeSound(){
		song.resume()
	}
	
	method stopSound(){
		song.stop()
	}
	
	method playedSound(){
		return song.played()
	}
}

const opening = new SongsPokemon(song = game.sound("sounds/opening.mp3"))
const route1 = new SongsPokemon(song = game.sound("sounds/route1.mp3"))
const soundBattle = new SongsPokemon(song = game.sound("sounds/battle.mp3"))
const ending = new SongsPokemon(song = game.sound("sounds/battle.mp3"))


