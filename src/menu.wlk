import wollok.game.*
import pokemon.*
import screen.*
import red.*
import sound.*

//Flechita para el menu
object arrow{
	const property image = "maps/arrow.png"
	var property position = game.at(38, 6)
	var property option = null
	
	//Restricciones de movimientos para la flecha del menu
	var restrictionRight = false
	var restrictionLeft = true
	var restrictionUp = true
	var restrictionDown = false
	
	method right() {
		if(!restrictionRight){
			self.soundChange()			
			position = position.right(11)
			restrictionRight = !restrictionRight
			restrictionLeft = !restrictionLeft		
		}
	}
	
	method left() {
		if(!restrictionLeft){
			self.soundChange()			
			position = position.left(11)
			restrictionRight = !restrictionRight
			restrictionLeft = !restrictionLeft		
		}
	}
	
	method up() {
		if(!restrictionUp){
			self.soundChange()			
			position = position.up(4)
			restrictionUp = !restrictionUp
			restrictionDown = !restrictionDown	
		}
	}
	
	method down() {
		if(!restrictionDown){
			self.soundChange()			
			position = position.down(4)
			restrictionUp = !restrictionUp
			restrictionDown = !restrictionDown	
		}
	}
	
	method soundChange(){
		game.sound("sounds/changeOption.mp3").play()	
	}
	
	method action(){
		if(position.toString() == '38@6'){
			option = fight
			fight.itIsInsideFight()		
		}else if(position.toString() == '49@6'){
			option = backpack
			console.println('MOCHILA')
		}else if(position.toString() == '38@2'){
			option = pokemon
			console.println('POKEMON')
		}else{
			option = flight
			flight.runAway()			
		}
	}
	
	method goBack(){
		option.back()
	}
}

class Menu{
	method runAway(){
		game.clear()
		soundBattle.pauseSound()
		characterScreen.initializeCharacter()
		map1.addVisualInBoard()
		route1.resumeSound()
	}
	
	method back(){}
	method itIsInsideFight(){}
}
object fight inherits Menu{
	
	override method itIsInsideFight(){
		if(game.hasVisual(fightFireSign)){
			console.println('estoy atroden')
		}else{
			self.fightMenu()
		}
	}
	
	method fightMenu(){
		game.addVisualIn(fightFireSign, game.at(37, 0))
		//Para que la flecha se posicione arriba de la nueva imagen (si no queda abajo), pensar otra mejor forma
		game.removeVisual(arrow)
		game.addVisual(arrow)
	}
	
	
	override method back(){
		if(game.hasVisual(fightFireSign)){
			game.removeVisual(fightFireSign)
			arrow.option(null)
		}
	}
}
object backpack inherits Menu{}
object pokemon inherits Menu{}

object flight inherits Menu{
	override method back(){
		arrow.option(null)
	}
}



