import wollok.game.*
import sound.*
import map.*
import red.*
import pokemon.*
import arrow.*

class ConfigurationScreen {
	
	method initialSettingsGame() {
		//Algunas configuraciones para iniciar
		game.title("Pokemon Red")
		game.height(34)
		game.width(60)
		game.cellSize(20)
	}
}

//Inicializa a red con sus movimientos y colisiones
object characterScreen{
	method initializeCharacter(){
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

object arrowScreen{
	method initializeArrow(){

		game.addVisualCharacter(arrow)
		
		keyboard.right().onPressDo({ arrow.right() })
		keyboard.left().onPressDo({ arrow.left() })
		keyboard.up().onPressDo({ arrow.up() })
		keyboard.down().onPressDo({ arrow.down() })		
	}
}
class MapScreen inherits ConfigurationScreen{
	
	method addConfigurations(nameOfMap) {	
		game.boardGround(nameOfMap.image())
		characterScreen.initializeCharacter() //inicializamos en personaje para que conviva con el entorno
		
		route1.playSound()	//Agrega la musica inicial que se reprograma apenas termina		
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc.
		nameOfMap.constructInvisibleNormalObjects()
		nameOfMap.addVisualInBoard()
	}
}	



class BattleScreen inherits ConfigurationScreen{
	method addConfigurations(){
		game.addVisualCharacterIn(battle, game.at(0, 0))
		game.addVisualCharacterIn(charmander, game.at(8, 8))
		game.addVisualCharacterIn(bulbasaur, game.at(37,16))

		arrowScreen.initializeArrow()


		//Objetos sueltos (por si no usamos el fondo con todo establecido)
		//game.addVisualCharacterIn(sign1, game.at(35, 7))	//Nuestro cartel de vida posicion
		//game.addVisualCharacterIn(sign2, game.at(10, 24))	//Cartel oponente de vida posicion
		//game.addVisualCharacterIn(sign3, game.at(0, 0))		//Cuadro de dialogos posicion
		//game.addVisualCharacterIn(sign4, game.at(39, 0))	//Cartel con los menus (lucha, correr, etc)

		const battleSong = game.sound("sounds/battle.mp3")
		route1.stopSound()
		battleSong.shouldLoop(true)	//Suena la cancion con un loop
		battleSong.volume(0.7)
		battleSong.play()
	}
}

class BattleObject{
	const property image
}

//----------------------------instances------------------------------//
//Configuracion escenarios
const initialMap = new MapScreen()
const battleScreen = new BattleScreen()
//Mapa de presentacion
const map1 = new InitialMap (image = "maps/map1.jpg")		//Background mapa inicial
//const battle = new BattleMap (image = "maps/battle2.jpg")	//background batalla
const battle = new BattleObject(image = "maps/prueba.png")

//Carteles con la vida, experiencia, nivel y nombre
//const sign1 = new BattleObject(image = "maps/statusSign.png")
//const sign2 = new BattleObject(image = "maps/statusSign.png")
//const sign3 = new BattleObject(image = "maps/buttomSign.png")
//const sign4 = new BattleObject(image = "maps/menuSign.png")


