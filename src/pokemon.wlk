class Pokemon {
	
	const front
	const back
	var property topLife = 100
	var property life = topLife
	var property level = 1
	var property image = front
	const ownPokemon = false
	var property type //string tipo de pokemon para elegir el cartel del ataque del pokemon

	//Si es nuestro pokemon, se va a ver de espaldas y si es oponente de frente
	method pickImage(){
		if(ownPokemon) image = back else image = front
	}
	
	method takeDamage(damage){
		life = (life - damage).max(0)
	}
	
	method heal(healingValue){
		life = (life + healingValue).min(topLife)
	}
	method levelUp(){
		level += 1
	}	
	//tackleAttack
	method attack1(){
		return 20
	}
	method isDead(){
		return self.life() == 0
	}		
}
 class PokemonFireType inherits Pokemon{
 	//flamethrowerAttack
 	method attack2(){
 		return 8.randomUpTo(14).truncate(0) + self.level() * 2
 	}
 	//emberAttack
 	method attack3(){
 		return 3.randomUpTo(24).truncate(0) + self.level() * 2
 	}
 	//firePunchAttack
 	method attack4(){
 		return 12 + self.level() * 2 	
 	}
 }
 
 class PokemonWaterType inherits Pokemon{
 	//hidroBombAttack
 	method attack2(){
 		return 20
 	}
 	//waterGunAttack
 	method attack3(){
 		 return 20.randomUpTo(24).truncate(0) + self.level() * 2
 	}
 	//bubleAttack
 	method attack4(){
 		return 1.randomUpTo(50).truncate(0)
 	}
 	
 }
 class PokemonGrassType inherits Pokemon{
 	//razorLeafAttack
 	method attack2(){
 		return 3 + (self.level() * 2)
 	}
 	//vineWhipAttack
 	method attack3(){
 		return 3.randomUpTo(10).truncate(0) + self.level() * 2
 		
 	}
 	//sharpenAttack
 	method attack4(){
 		return 0.randomUpTo(20).truncate(0)
 	}
 }
 


const charmander = new PokemonFireType(ownPokemon = true, front = "pokemons/charmanderFront.png",back="pokemons/charmanderBack.png",type="Fire")
const growlithe = new PokemonFireType(front="pokemons/growlitheFront.png",back="pokemons/growlitheBack.png",type="Fire")
const magmar= new PokemonFireType(front="pokemons/magmarFront.png",back="pokemons/magmarBack.png",type="Fire")
const ponyta= new PokemonFireType(front="pokemons/ponytaFront.png",back="pokemons/ponytaBack.png",type="Fire")
const bulbasaur = new PokemonGrassType(front ="pokemons/bulbasaurFront.png",back="pokemons/bulbasaurBack.png",type="Grass")
const oddish = new PokemonGrassType(front="pokemons/oddishFront.png",back="pokemons/oddishBack.png",type="Grass")
const butterfree= new PokemonGrassType(front="pokemons/butterfreeFront.png",back="pokemons/butterfreeBack.png",type="Grass")
const scyther= new PokemonGrassType(front="pokemons/Scytherfront.png",back="pokemons/Scytherback.png",type="Grass") 
const squirtle = new PokemonWaterType(front="pokemons/squirtleFront.png",back="pokemons/squirtleBack.png",type="Water")
const lapras = new PokemonWaterType(front="pokemons/laprasFront.png",back="pokemons/laprasBack.png",type="Water")
const gyarados= new PokemonWaterType(front="pokemons/gyaradosFront.png",back="pokemons/gyaradosBack.png",type="Water")
const psyduck= new PokemonWaterType(front="pokemons/psyduckFront.png",back="pokemons/psyduckBack.png",type="Water")



