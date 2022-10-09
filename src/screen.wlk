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
		game.addVisualCharacterIn(charmander, game.at(10, 4))
		game.addVisualCharacterIn(bulbasaur, game.at(37,14))
		game.addVisualCharacterIn(sign1, game.at(35, 6))	//Nuestro cartel de vida posicion
		game.addVisualCharacterIn(sign2, game.at(10, 24))	//Cartel oponente de vida posicion
		game.addVisualCharacterIn(sign3, game.at(0, 0))		//Cuadro de dialogos posicion
		game.addVisualCharacterIn(sign4, game.at(39, 0))	//Cartel con los menus (lucha, correr, etc)
		const battleSong = game.sound("sounds/battle.mp3")
		battleSong.shouldLoop(true)	//Suena la cancion con un loop
		battleSong.play()
	}
}

class BattleSign{
	const property image
}

//----------------------------instances------------------------------//
//Configuracion escenarios
const initialMap = new MapScreen()
const battleScreen = new BattleScreen()
//Mapa de presentacion
const map1 = new InitialMap (image = "maps/map1.jpg")
const battle = new BattleMap (image = "maps/gardenBG.png")
//Carteles con la vida, experiencia, nivel y nombre
const sign1 = new BattleSign(image = "maps/statusSign.png")
const sign2 = new BattleSign(image = "maps/statusSign.png")
const sign3 = new BattleSign(image = "maps/buttomSign.png")
const sign4 = new BattleSign(image = "maps/menuSign.png")


