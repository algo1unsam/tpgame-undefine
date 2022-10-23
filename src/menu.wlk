import wollok.game.*
import pokemon.*
import screen.*
import red.*
import sound.*
import fight.*

//Flechita para el menu
object arrow{
	const property image = "maps/arrow.png"
	var property position = game.at(38, 6)
	var property option = null
	var property block = null
	
	//Restricciones de movimientos para la flecha del menu
	var property restrictionRight = false
	var property restrictionLeft = true
	var property restrictionUp = true
	var property restrictionDown = false
	
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
			block = 1
			self.isInMenu()
			option.itIsInside()
		}else if(position.toString() == '49@6'){
			block = 2
			self.isInMenu()
			option.itIsInside()
		}else if(position.toString() == '38@2'){
			block = 3
			self.isInMenu()
			option.itIsInside()			
		}else{
			block = 4
			self.isInMenu()
			option.itIsInside()						
		}
	}
	
	method isInMenu(){
		if(option == null){
			if(block == 1){
				option = fight
			}else if(block == 2){
				option = backpack
			}else if(block == 3){
				option = pokemon
			}else{
				option = flight
			}
		}
	}
	
	method goBack(){
		if(option != null){
			option.back()
			option = null
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
		arrow.option(null)
	}
	
	method back(){
		arrow.option(null)
	}
	
	method itIsInside(){}
	method configMenu(){}
		
	method returnArrow(){
		arrow.restrictionRight(false)
		arrow.restrictionLeft(true)
		arrow.restrictionUp(true)
		arrow.restrictionDown(false)
		game.removeVisual(arrow)
		game.addVisualIn(arrow, game.at(38, 6))
	}
}
object fight inherits Menu{
	
	override method itIsInside(){	
		if(game.hasVisual(fightFireSign)){
			battle.attackScene(arrow.block()) //llamamos a la escena de batalla donde va a ocurrir los eventos que generen los primeros ataques
		}else{
			self.configMenu()
		}
	}
	
	override method configMenu(){
		game.addVisualIn(fightFireSign, game.at(37, 0))
		//Para que la flecha se posicione arriba de la nueva imagen (si no queda abajo), pensar otra mejor forma
		game.removeVisual(arrow)
		game.addVisual(arrow)
	}
	
	//Si tiene la imagen del menu correspondiente la remueve y vuelve al menu anterior
	override method back(){
		if(game.hasVisual(fightFireSign)){
			game.removeVisual(fightFireSign)
			arrow.option(null)
			//self.returnArrow() //ESTE ES EL QUE HACE VOLVER LA FLECHA
		}
	}
}
object backpack inherits Menu{
	override method itIsInside(){	
		if(game.hasVisual(menuFalso)){
			console.println('ESTAS ADENTRO DE MOCHILA')
		}else{
			self.configMenu()
		}
	}
	
	override method configMenu(){
		game.addVisualIn(menuFalso, game.at(37, 0))
		//Para que la flecha se posicione arriba de la nueva imagen (si no queda abajo), pensar otra mejor forma
		game.removeVisual(arrow)
		game.addVisual(arrow)
	}
	
	override method back(){
		if(game.hasVisual(menuFalso)){
			game.removeVisual(menuFalso)
			arrow.option(null)
		}
	}
}
object pokemon inherits Menu{
	override method itIsInside(){	
		if(game.hasVisual(menuFalso)){
			console.println('ESTAS ADENTRO DE POKEMON')
		}else{
			self.configMenu()
		}
	}
	
	override method configMenu(){
		game.addVisualIn(menuFalso, game.at(37, 0))
		//Para que la flecha se posicione arriba de la nueva imagen (si no queda abajo), pensar otra mejor forma
		game.removeVisual(arrow)
		game.addVisual(arrow)
	}
	
	override method back(){
		if(game.hasVisual(menuFalso)){
			game.removeVisual(menuFalso)
			arrow.option(null)
		}
	}
}

object flight inherits Menu{	
	override method itIsInside(){
		self.runAway()
	}
	
	override method back(){
		arrow.option(null)
	}
	
}

//TODO:RETURNARROW PARA QUE VUELVA LA FLECHA Y SE PUEDA MOVER CON LAS PRIMERAS RESTRICCIONES
//TODO: AL ESPERAR EL ATAQUE RIVAL NO PODER MOVER NADA
//TODO: COLLIDER ENTRADA Y SALIDA Y COLINITAS Q FALTAN
//TODO: MOCHILA Y POKEMONS
//TODO: TERMINAR EL JUEGO

