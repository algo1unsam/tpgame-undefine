import wollok.game.*
import pokemon.*
import red.*
import sound.*
import screen.*
import menu.*
import fight.*

object backPack{
	var property myBackPack = [rareCandy, healingPotion, apple, damangeX]
	const signs = [candySign, potionSign, appleSign, damangeXSign]
	
	method actionBackPack(option){
		var flag = false
		//Le asigno a la var item el elemento que eligio en el menu
		const item = myBackPack.get(option - 1)
		if(item.areThereUnits()){
			item.useInPokemon(red.fight())
			flag = true
		}
		
		self.useItem(flag)
	}
	
	method useItem(flag){
		soundBattle.pauseSound()
		battle.redWait(4000)
		game.schedule(3000, {soundBattle.resumeSound()})
		if(flag){
			game.sound("sounds/useItem.mp3").play()
			self.itemSign(signs.get(arrow.block() - 1))						
		}else{
			game.sound("sounds/notItem.mp3").play()
			self.itemSign(notItem)	
		}

		console.println('vida propia ' + red.fight().life())
		console.println('level ' + red.fight().level())
		console.println('vida rival ' + botFighter.name().life())
	}
	
	method itemSign(item){
		if(!game.hasVisual(item)){
			game.addVisualIn(item, game.at(5, 1))
			game.schedule(4500, { game.removeVisual(item) })		
		}
	}

}

class Item{
	var property units = 1
	method useInPokemon(pokemon){
		units -= 1
	}
	
	method areThereUnits(){
		return units > 0
	}
}

object healingPotion inherits Item{
	var property healingValue = 500

	override method useInPokemon(pokemon){
		super(pokemon)
		pokemon.heal(healingValue)		
	}
} 
object rareCandy inherits Item{
	override method useInPokemon(pokemon){
		super(pokemon)
		pokemon.levelUp()
	}
}

object apple inherits Item{
	var property healingValue = 150
	
	override method useInPokemon(pokemon){
		super(pokemon)		
		pokemon.heal(healingValue)
	}
}
	
object damangeX inherits Item{
	//Le resta 150 al oponente
	override method useInPokemon(pokemon){
		super(pokemon)		
		botFighter.name().takeDamage(150)
	}
}