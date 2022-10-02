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
	
	method addConfigurations(){	
		game.boardGround(map1.image())
		game.addVisualCharacter(red)
		route1.playSound()	//Agrega la musica inicial que se reprograma apenas termina
		
			
		//prueba
		//Agrego los objetos invisibles para los colisione los arboles, rejas, etc
		game.addVisual(collider1)
		game.addVisual(collider2)
		game.addVisual(collider3)
		game.addVisual(grass1)
		game.addVisual(grass2)
		game.addVisual(grass3)
		game.addVisual(grass4)
		game.addVisual(grass5)
		game.addVisual(grass6)
		game.addVisual(grass7)
		game.addVisual(grass8)
		game.addVisual(grass9)
		game.addVisual(grass10)
		game.addVisual(grass11)
		game.addVisual(grass12)
		
		//PRUEBA
		game.onCollideDo(collider1, { el => el.rebound()})
		game.onCollideDo(collider2, { el => el.rebound()})
		game.onCollideDo(collider3, { el => el.rebound()})
		game.onCollideDo(grass1, {el => grass1.stepOnGrass()})
		game.onCollideDo(grass2, {el => grass2.stepOnGrass()})
		game.onCollideDo(grass3, {el => grass3.stepOnGrass()})
		game.onCollideDo(grass4, {el => grass4.stepOnGrass()})
		game.onCollideDo(grass5, {el => grass1.stepOnGrass()})
		game.onCollideDo(grass6, {el => grass2.stepOnGrass()})
		game.onCollideDo(grass7, {el => grass3.stepOnGrass()})
		game.onCollideDo(grass8, {el => grass4.stepOnGrass()})
		game.onCollideDo(grass9, {el => grass1.stepOnGrass()})
		game.onCollideDo(grass10, {el => grass2.stepOnGrass()})
		game.onCollideDo(grass11, {el => grass3.stepOnGrass()})
		game.onCollideDo(grass12, {el => grass4.stepOnGrass()})
	
		//El juego queda en espera de los movimientos configurados
		keyboard.right().onPressDo{red.right()}
		keyboard.left().onPressDo{red.left()}
		keyboard.up().onPressDo{red.up()}
		keyboard.down().onPressDo{red.down()}	
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


