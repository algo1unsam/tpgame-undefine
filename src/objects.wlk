import pokemon.*
import red.*

object mochila{
	const artefacts=[]
	const maxCapacity=10
	
	method bagIsFull(){
		return (artefacts.size()<maxCapacity)
	}
	
	method addObjectFromTheBag(object_){
		if(artefacts.size()<maxCapacity){
			artefacts.add(object_)
		}	
	}
	method takeObjectFromTheBag(object_){
		artefacts.remove(object_)
	}
	method useObjectFromTheBag(pokemon){
		artefacts.forEach({object_=>object_.useInPokemon(pokemon)})
	}
	

}
object healingPotion{
	var property healingValue=500
	
	method useInPokemon(pokemon){
		pokemon.heal(healingValue)
	}
} 
object rareCandy{
	method useInPokemon(pokemon){
		pokemon.levelUp()
	}
}
object pokeBall{
	method useInPokemon(pokemon){
		if (pokemon.isWeak()){
			pokemon.beCaptured()
		}
	}
}
object repellent{
	method useInRed(){
		red.grassSteps(-100)
	}
}
