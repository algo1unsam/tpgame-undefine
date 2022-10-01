import wollok.game.*
import trainer.*
import sound.*
import red.*
import element.*

object pokemonRed {

	method initialSettingsGame() {
		//Algunas configuraciones para iniciar
		game.title("Pokemon Red")
		game.boardGround("maps/mapa2.jpg")
		game.height(34)
		game.width(60)
		game.addVisualCharacter(red)
		game.cellSize(20)
		songsPokemon.route1Sound()	//Agrega la musica inicial que se reprograma apenas termina
		
		//prueba
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc
		game.addVisual(collider1)
		game.addVisual(collider2)
		game.addVisual(collider3)
		
		//PRUEBA
		game.whenCollideDo(collider1, { el => el.rebound()})
		game.whenCollideDo(collider2, { el => el.rebound()})
		game.whenCollideDo(collider3, { el => el.rebound()})

		//El juego queda en espera de los movimientos configurados
		keyboard.right().onPressDo{red.right()}
		keyboard.left().onPressDo{red.left()}
		keyboard.up().onPressDo{red.up()}
		keyboard.down().onPressDo{red.down()}	
	}

}

