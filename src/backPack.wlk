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
		//Le asigno a la var item el elemento que eligio en el menu
		const item = myBackPack.get(option - 1)
		
		item.useInPokemon(red.fight())
		self.useItem()
	}
	
	method useItem(){
		soundBattle.pauseSound()
		game.sound("sounds/useItem.mp3").play()
		battle.redWait(4000)
		game.schedule(3000, {soundBattle.resumeSound()})
		self.itemSign(signs.get(arrow.block() - 1))
		console.println('vida propia ' + red.fight().life())
		console.println('level ' + red.fight().level())
		console.println('vida rival ' + botFighter.name().name().life())
	}
	
	method itemSign(item){
		if(!game.hasVisual(item)){
			game.addVisualIn(item, game.at(5, 1))
			game.schedule(4500, { game.removeVisual(item) })		
		}
	}

}

class Item{
		method useInPokemon(pokemon){}
}

object healingPotion inherits Item{
	var property healingValue = 500

	override method useInPokemon(pokemon){
		pokemon.heal(healingValue)
	}
} 
object rareCandy inherits Item{
	override method useInPokemon(pokemon){
		pokemon.levelUp()
	}
}

object apple inherits Item{
	var property healingValue = 150
	
	override method useInPokemon(pokemon){
		pokemon.heal(healingValue)
	}
}
	
object damangeX inherits Item{
	//Le resta 150 al oponente
	override method useInPokemon(pokemon){
		botFighter.name().name().takeDamage(150)
	}
}