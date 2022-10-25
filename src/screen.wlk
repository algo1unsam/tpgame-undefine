import wollok.game.*
import sound.*
import map.*
import red.*
import pokemon.*
import menu.*
import fight.*
import leaders.*

class MapScreen {
	
	method initialSettingsGame() {
		//Algunas configuraciones para iniciar
		game.title("Pokemon Red")
		game.height(34)
		game.width(60)
		game.cellSize(20)
	}
	
		method addConfigurations(nameOfMap) {	
		route1.playSound()
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
		//Inicializamos por otro lado los malvados lideres pokemones
		game.addVisual(leon)
		game.addVisual(alete)
		game.addVisual(lucas)
		
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
	const property lvlPathRed = "levels/"+fighterRed.name().level().toString()+".png"
	const property lvlPathBot = "levels/"+botFighter.name().level().toString()+".png"
	const property pathSing = "maps/attack"
	const property pathLife = "healthbars/healthbar"
	
	//..................... 0 == cartelvida; 1 == nombre;   2 == nivel
	const property botPos = [game.at(8, 26),game.at(6, 28),game.at(20,29)]
	const property redPos = [game.at(39, 13),game.at(37,15),game.at(51,16)]
	
	method addConfigurations(){
		console.println("entro cada vez que se pelea")
		game.addVisualIn(battleGround, game.at(0, 0))
		//damos el nombre del pokemon contra el que vaa luchar red
		botFighter.name(map1.mapPokemons().anyOne()) //lo re instanciamos para que cuando termine una batalla o se huya de la actual aprezca un pokemon nuevo		
		botFighter.randomLevel(3)//damos level random no mas de 3 niveles mas que el pokemon de red y no menos que 3
		//instanciamos nombres, niveles, carteles y vida
		self.instanceImages()
		//agrego los nombres de los pokemons a el board
		game.addVisualIn(namePokemonRed,redPos.get(1)) //TODO: ubicar bien
		game.addVisualIn(nameSavagePokemon,botPos.get(1)) //TODO: ubicar bien
		 //agrego los lvs al board
		game.addVisualIn(lvPokemonRed,redPos.get(2)) //TODO: ubicar bien
		game.addVisualIn(lvSavagePokemon,botPos.get(2)) //TODO: ubicar bien
		//agrego los carteles de vida inciales de los pokemons
		//obtengo el indice correspondiente del cartel d ela vida
		fighterRed.getBettwenNumers()
		game.addVisualIn(fighterRed.lifeImage().get(fighterRed.indexImageLife()),redPos.get(0))
		game.addVisualIn(botFighter.lifeImage().get(botFighter.lifeImage().size()-1),botPos.get(0))
		console.println(fighterRed.lifeImage().size())
		//agrego pokemons al board
		game.addVisualIn(fighterRed.name(), game.at(8, 8))
		game.addVisualIn(botFighter.name(), game.at(37,18))
		
		
		arrowScreen.initializeArrow()

		route1.pauseSound()

//		//Si el sonido alguna vez fue inicializado que lo resuma, si no que lo inicialize
		(if (soundBattle.playedSound()) soundBattle.resumeSound() else soundBattle.playSound())

	}
	method instanceImages(){
		const botP = pathSing+botFighter.name().type()
		const redP = pathSing+fighterRed.name().type()
		const namPathRed = "Names/"+fighterRed.name().name()+".png"
		const namPathBot = "Names/"+botFighter.name().name()+".png"
		
		//inicializo los nombres de los pokemons
		namePokemonRed.image(namPathRed)
		nameSavagePokemon.image(namPathBot)
		//inicializo el lvl de los pokemon
		lvPokemonRed.image(lvlPathRed)
		lvSavagePokemon.image(lvlPathBot)
		//instanciamos los carteles para cada luchador
		botFighter.signs().clear()
		fighterRed.signs().clear()
		botFighter.initialiteBattleObjects(4, botP,botFighter.signs())
		fighterRed.initialiteBattleObjects(4,redP ,fighterRed.signs())
		
		//instanciamos los carteles de vida para cada luchador
		botFighter.lifeImage().clear()
		fighterRed.lifeImage().clear()
		botFighter.initialiteBattleObjects(9, pathLife,botFighter.lifeImage())
		fighterRed.initialiteBattleObjects(9, pathLife,fighterRed.lifeImage())
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

//Imagen inicial
object mainScreen{
	const property image = "maps/initialScreen.png"
}

object finalScreen{
	const property image = "maps/ending.png"
}

object enter{
	const property image = "maps/enter.png"
	
	method waitFor(){
		if(game.hasVisual(self)){
			game.removeVisual(self)
		}else{
			game.addVisualIn(self, game.at(24,26))
		}
		keyboard.enter().onPressDo({self.exit()})
	}
	
	method twinkle(){
		game.onTick(900, "twinkle", {self.waitFor()})
	}
	
	method exit(){
		game.clear()
		opening.stopSound()
		initialScreen.addConfigurations(map1)
		
	}
}

//Mapa batalla (no es background) es un objecto que tapa el background
const battleGround = new BattleObject(image = "maps/prueba.png")
const fightFireSign = new BattleObject(image = "maps/fightFireSign.png")
const backPackSign = new BattleObject(image = "maps/backpack.png")
const statusPokemonSign = new BattleObject(image = "maps/charmanderStatus.png")
const candySign = new BattleObject(image = "maps/candy.png")
const potionSign = new BattleObject(image = "maps/potion.png")
const appleSign = new BattleObject(image = "maps/apple.png")
const damangeXSign = new BattleObject(image = "maps/damangeX.png")
const notItem = new BattleObject(image = "maps/notItem.png")
const crossDead = new BattleObject(image = "maps/crosss.png")//cruz cuando muere un pokemon (provizional)
const namePokemonRed = new BattleObject(image = "names/+pokemon.nombre().toString()+.png")
const nameSavagePokemon = new BattleObject(image = "maps/nombres/+pokemon.nombre().toString()+.png")
const lvPokemonRed = new BattleObject(image = "maps/lv/+pokemon.level().toString()+.png")
const lvSavagePokemon = new BattleObject(image = "maps/lv/+pokemon.level().toString()+.png")

