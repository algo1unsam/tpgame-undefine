class Pokemon {
	
	const front
	const back
	var property name
	var property topLife = 1000
	var property life = topLife
	var property level = 1
	var property image = front
	const ownPokemon = false
	var property type //string tipo de pokemon para elegir el cartel del ataque del pokemon

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
	method isDead(){
		return self.life() == 0
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
 	//hidroBombAttack
 	method attack2(){
 		return 200 + (self.level() * 10)
 	}
 	//waterGunAttack
 	method attack3(){
 		return 150 + (self.level() * 10)
 	}
 	//bubleAttack
 	method attack4(){
 		return 100 + (self.level() * 10)
 	}
 	
 }
 class PokemonGrassType inherits Pokemon{
 	//razorLeafAttack
 	method attack2(){
 		return 200 + (self.level() * 10)
 	}
 	//vineWhipAttack
 	method attack3(){
 		return 150 + (self.level() * 10)
 		
 	}
 	//sharpenAttack
 	method attack4(){
 		return 100 + (self.level() * 10)
 	}
 }
 


const charmander = new PokemonFireType(ownPokemon = true, front = "pokemons/charmanderFront.png",back="pokemons/charmanderBack.png",name="Charmander",type="Fire")
const growlithe = new PokemonFireType(front="pokemons/growlitheFront.png",back="pokemons/growlitheBack.png",name="Growlithe",type="Fire")
const magmar= new PokemonFireType(front="pokemons/magmarFront.png",back="pokemons/magmarBack.png",name="Magmar",type="Fire")
const ponyta= new PokemonFireType(front="pokemons/ponytaFront.png",back="pokemons/ponytaBack.png",name="Ponyta",type="Fire")
const bulbasaur = new PokemonGrassType(front ="pokemons/bulbasaurFront.png",back="pokemons/bulbasaurBack.png",name="Bulbasaur",type="Grass")
const oddish = new PokemonGrassType(front="pokemons/oddishFront.png",back="pokemons/oddishBack.png",name="Oddish",type="Grass")
const butterfree= new PokemonGrassType(front="pokemons/butterfreeFront.png",back="pokemons/butterfreeBack.png",name="Buterfree",type="Grass")
const scyther= new PokemonGrassType(front="pokemons/Scytherfront.png",back="pokemons/Scytherback.png",name="Scyther",type="Grass") 
const squirtle = new PokemonWaterType(front="pokemons/squirtleFront.png",back="pokemons/squirtleBack.png",name="Squirtle",type="Water")
const lapras = new PokemonWaterType(front="pokemons/laprasFront.png",back="pokemons/laprasBack.png",name="Lapras",type="Water")
const gyarados= new PokemonWaterType(front="pokemons/gyaradosFront.png",back="pokemons/gyaradosBack.png",name="Gyarados",type="Water")
const psyduck= new PokemonWaterType(front="pokemons/psyduckFront.png",back="pokemons/psyduckBack.png",name="Psyduck",type="Water")