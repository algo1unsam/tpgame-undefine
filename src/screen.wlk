
import wollok.game.*
import sound.*
import map.*
import red.*
import pokemon.*

class ConfigurationScreen {
	
	method initialSettingsGame() {
		//Algunas configuraciones para iniciar
		game.title("Pokemon Red")
		game.height(34)
		game.width(60)
		game.cellSize(20)
	}
}

class MapScreen inherits ConfigurationScreen{
	
	method addConfigurations(nameOfMap) {	
		game.boardGround(nameOfMap.image())
		game.addVisualCharacter(red)
		route1.playSound()	//Agrega la musica inicial que se reprograma apenas termina
		
			
		//prueba
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc
		nameOfMap.constructInvisibleNormalObjects()
		nameOfMap.addVisualInBoard()
		//TODO: solucionar problemas de rendimiento con intialiteColliders
		//nameOfMap.intialiteColliders()
		
		//El juego queda en espera de los movimientos configurados
		keyboard.right().onPressDo({red.right()})
		keyboard.left().onPressDo({red.left()})
		keyboard.up().onPressDo({red.up()})
		keyboard.down().onPressDo({red.down()})
	}
}	



class BattleScreen inherits ConfigurationScreen{
	method addConfigurations(){
		game.boardGround(battle.image())
		game.addVisualCharacterIn(pikachu, game.at(10,10))
		game.addVisualCharacterIn(charmander, game.at(39,20))
//		teamRocket.playSound()	//Agrega la musica inicial que se reprograma apenas termina
	}
}

const mainScreen = new MapScreen()
const battleScreen = new BattleScreen()


