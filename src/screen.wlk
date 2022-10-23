import wollok.game.*
import sound.*
import map.*
import red.*
import pokemon.*
import menu.*
import fight.*

class MapScreen {
	
	method initialSettingsGame() {
		//Algunas configuraciones para iniciar
		game.title("Pokemon Red")
		game.height(34)
		game.width(60)
		game.cellSize(20)
	}
	
		method addConfigurations(nameOfMap) {	
		//const route1 = game.sound("sounds/route1.mp3")
//		route1.shouldLoop(true)	//Suena la cancion con un loop	
//		route1.play()	

		characterScreen.initializeCharacter() //inicializamos en personaje para que conviva con el entorno
		
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc.
		nameOfMap.constructInvisibleNormalObjects()
		nameOfMap.addVisualInBoard()
	}
}

//Inicializa a red con sus movimientos y colisiones
object characterScreen{
	method initializeCharacter(){
		//inicializamos visual del pj
		game.addVisual(red)
		red.instanceColliders() //instancaimos las coliciones de red contra los objetos
		//El juego queda en espera de los movimientos configurados
		keyboard.right().onPressDo({red.right()})
		keyboard.left().onPressDo({red.left()})
		keyboard.up().onPressDo({red.up()})
		keyboard.down().onPressDo({red.down()})
	}
}

object arrowScreen{
	method initializeArrow(){

		game.addVisual(arrow)
		
		keyboard.right().onPressDo({ arrow.right() })
		keyboard.left().onPressDo({ arrow.left() })
		keyboard.up().onPressDo({ arrow.up() })
		keyboard.down().onPressDo({ arrow.down() })	
		keyboard.enter().onPressDo({arrow.action()})	
		keyboard.backspace().onPressDo({arrow.goBack()})
	}
}

class BattleScreen {
	
	method addConfigurations(){
		game.addVisualIn(battleGround, game.at(0, 0))
		//damos el nombre del pokemon contra el que vaa luchar red
		botFighter.name(map1.mapPokemons().anyOne()) //lo re instanciamos para que cuando termine una batalla o se huya de la actual aprezca un pokemon nuevo		
		//instanciamos los carteles para cada pokemon
		botFighter.initialiteSigns()
		fighterRed.initialiteSigns()
		game.addVisualIn(fighterRed.name(), game.at(8, 8))
		game.addVisualIn(botFighter.name(), game.at(37,18))

		arrowScreen.initializeArrow()
		

		//Objetos sueltos (por si no usamos el fondo con todo establecido)
		//game.addVisual(sign1, game.at(35, 7))	//Nuestro cartel de vida posicion
		//game.addVisual(sign2, game.at(10, 24))	//Cartel oponente de vida posicion
		//game.addVisual(sign3, game.at(0, 0))		//Cuadro de dialogos posicion
		//game.addVisual(sign4, game.at(39, 0))	//Cartel con los menus (lucha, correr, etc)

		route1.pauseSound()

//		//Si el sonido alguna vez fue inicializado que lo resuma, si no que lo inicialize
		(if (soundBattle.playedSound()) soundBattle.resumeSound() else soundBattle.playSound())

	}
}

class BattleObject{
	var property image
}

//----------------------------instances------------------------------//
//Configuracion escenarios
const initialScreen = new MapScreen()
const battleScreen = new BattleScreen()

//Mapa de presentacion
const map1 = new InitialMap (image = "maps/map1.jpg")		//Background mapa inicial

//Mapa batalla (no es background) es un objecto que tapa el background
const battleGround = new BattleObject(image = "maps/prueba.png")
const menuFalso = new BattleObject(image = "maps/menuFalso.png")
const fightFireSign = new BattleObject(image = "maps/fightFireSign.png")
const attackPoster = new BattleObject(image = "maps/attack+tipoDePokemon+NumeroDeAtaque+.png") //la imagen va a ser cambiada dependiendo del tipo de pokemon(primera letra mayusucula) y el ataque que use

//Carteles con la vida, experiencia, nivel y nombre
//const sign1 = new BattleObject(image = "maps/statusSign.png")
//const sign2 = new BattleObject(image = "maps/statusSign.png")
//const sign3 = new BattleObject(image = "maps/buttomSign.png")


