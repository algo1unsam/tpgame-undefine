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

object characterScreen{
	method initializateCharacter(){
		//inicializamos visual del pj
		game.addVisualCharacter(red)
		red.instanceColliders() //instancaimos las coliciones contra los objetos
		//El juego queda en espera de los movimientos configurados
		keyboard.right().onPressDo({red.right()})
		keyboard.left().onPressDo({red.left()})
		keyboard.up().onPressDo({red.up()})
		keyboard.down().onPressDo({red.down()})
	}
}
class MapScreen inherits ConfigurationScreen{
	
	method addConfigurations(nameOfMap) {	
		game.boardGround(nameOfMap.image())
		characterScreen.initializateCharacter() //inicializamos en personaje para que conviva con el entorno
		
		route1.playSound()	//Agrega la musica inicial que se reprograma apenas termina		
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc
		nameOfMap.constructInvisibleNormalObjects()
		nameOfMap.addVisualInBoard()
	}
}	



class BattleScreen inherits ConfigurationScreen{
	method addConfigurations(){
		game.boardGround(battle.image())
		game.addVisualCharacterIn(pikachu, game.at(10,10))
		game.addVisualCharacterIn(charmander, game.at(39,20))
//		teamRocket.playSound()	//Agrega la musica inicial que se reprograma apenas termina
		const battleSong = game.sound("sounds/battle.mp3")
		battleSong.play()
	}
}
const initialMap = new MapScreen()
const battleScreen = new BattleScreen()


