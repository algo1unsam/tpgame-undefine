import wollok.game.*
import pokemon.*
import screen.*
import red.*
import sound.*

//Flechita para el menu
object arrow{
	const property image = "maps/arrow.png"
	var property position = game.at(38, 6)
	
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
			fight.fightMenu()		
		}else if(position.toString() == '49@6'){
			console.println('MOCHILA')
		}else if(position.toString() == '38@2'){
			console.println('POKEMON')
		}else{
			flight.runAway()			
		}
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
}
object fight inherits Menu{
	method fightMenu(){
		game.addVisualIn(fightFireSign, game.at(37, 0))
		game.removeVisual(arrow)
		game.addVisual(arrow)
		
	}
}
object backpack inherits Menu{}
object pokemon inherits Menu{}
object flight inherits Menu{}



