class Pokemon {
	
	const front
	const back
	var property nombre
	var property vida = 1000
	var property level = 0
	
	method cambiarNombre(nuevoNombre){
		nombre=nuevoNombre
	}
	
	method recibirDanio(ataque){
		vida=(vida-ataque).max(0)
	}
	method curarse(cuantoSeCura){
		vida=(vida+cuantoSeCura).min(1000)
	}
	method aumentarDeNivel(){
		level+=1
	}
	method primeraEvolucion(){
		return self.level()>5 and self.level()<10
	}
	method segundaEvolucion(){
		return self.level()>10
	}
	method ataquePlacaje(){
		return 100
	}
	method estaDebil(){
		return self.vida() < 150
	}
	method serCapturado(){}
		
}
 class PokemonFuego inherits Pokemon{
 	method ataqueLanzallamas(){
 		return 200+(self.level()*10)
 	}
 	method ataqueAscuas(){
 		return 150+(self.level()*10)
 	}
 	method ataquePuniofuego(){
 		return 100+(self.level()*10) 	
 		}
 }
 class PokemonAgua inherits Pokemon{
 	method ataqueHidroBomba(){
 		return 200+(self.level()*10)
 	}
 	method ataquePistolaAgua(){
 		return 150+(self.level()*10)
 	}
 	method ataqueBurbuja(){
 		return 100+(self.level()*10)
 	}
 	
 }
 class PokemonHoja inherits Pokemon{
 	method ataqueHojaAfilada(){
 		return 200+(self.level()*10)
 	}
 	method ataqueLatigoCepa(){
 		return 150+(self.level()*10)
 		
 	}
 	method ataqueDrenaje(){
 		return 100+(self.level()*10)
 	}
 }
 

<<<<<<< HEAD


const charmander = new PokemonFuego(front = "pokemons/charmanderFront.png",back="pokemons/charmanderBack.png",nombre="Charmander")
const bulbasaur= new PokemonHoja(front ="pokemons/bulbasaurFront.png",back="pokemons/bulbasaurBack.png",nombre="Bulbasaur")
const squirtle= new PokemonAgua(front="pokemons/squirtleFront.png",back="pokemons/squirtleBack.png",nombre="Squirtle")
=======
const charmander = new Pokemon(image = "pokemons/charmanderBack.png")
const bulbasaur = new Pokemon(image = "pokemons/bulbasaurFront.png")
>>>>>>> master
