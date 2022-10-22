class Pokemon {
	
	const front
	const back
	var property name
	var property topLife = 1000
	var property life = topLife
	var property level = 1
	var property image = front
	const ownPokemon = false
	
	//Si es nuestro pokemon, se va a ver de espaldas y si es oponente de frente
	method pickImage(){
		if(ownPokemon) image = back else image = front
	}
	
	method changeName(newName){
		name = newName
	}
	
	method takeDamage(damage){
		life = (life - damage).max(0)
	}
	
	method heal(healingValue){
		life = (life + healingValue).min(topLife)
	}
	
	method levelUp(){
		level += 1
		topLife *= 1.1
	}
	
	//tackleAttack
	method attack1(){
		return 100
	}
	
	method isWeak(){
		return self.life() < 150
	}
	
	method beCaptured(){}
		
}
 class PokemonFireType inherits Pokemon{
 	//flamethrowerAttack
 	method attack2(){
 		return 200 + (self.level() * 10)
 	}
 	//emberAttack
 	method attack3(){
 		return 150 + (self.level() * 10)
 	}
 	//firePunchAttack
 	method attack4(){
 		return 100 + (self.level() * 10) 	
 		}
 }
 
 class PokemonWaterType inherits Pokemon{
 	method hidroBombAttack(){
 		return 200 + (self.level() * 10)
 	}
 	
 	method waterGunAttack(){
 		return 150 + (self.level() * 10)
 	}
 	
 	method bubleAttack(){
 		return 100 + (self.level() * 10)
 	}
 	
 }
 class PokemonGrassType inherits Pokemon{
 	method razorLeafAttack(){
 		return 200 + (self.level() * 10)
 	}
 	
 	method vineWhipAttack(){
 		return 150 + (self.level() * 10)
 		
 	}
 	
 	method sharpenAttack(){
 		return 100 + (self.level() * 10)
 	}
 }
 


const charmander = new PokemonFireType(ownPokemon = true, front = "pokemons/charmanderFront.png",back="pokemons/charmanderBack.png",name="Charmander")
const growlithe = new PokemonFireType(front="pokemons/growlitheFront.png",back="pokemons/growlitheBack.png",name="Growlithe")
const bulbasaur = new PokemonGrassType(front ="pokemons/bulbasaurFront.png",back="pokemons/bulbasaurBack.png",name="Bulbasaur")
const oddish = new PokemonGrassType(front="pokemons/oddishFront.png",back="pokemons/oddishBack.png",name="Oddish")
const squirtle = new PokemonWaterType(front="pokemons/squirtleFront.png",back="pokemons/squirtleBack.png",name="Squirtle")
const lapras = new PokemonWaterType(front="pokemons/laprasFront.png",back="pokemons/laprasBack.png",name="Lapras")
