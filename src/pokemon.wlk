class Pokemon {
	
	const front
	const back
	var property vida = 1000
	var property experiencia=0
	var property nombre
	var property level
	
	method cambiarNombre(nuevoNombre){
		nombre=nuevoNombre
	}
	
	method recibirDanio(danio){
		vida=(vida-danio).max(0)
	}
	method curarse(cuantoSeCura){
		vida=(vida+cuantoSeCura).min(1000)
	}
	method ganarExperiencia(cuantaExpGana){
		experiencia+=cuantaExpGana
	}
	method ataquePlacaje(){
		return 100
	}
		
}
 class PokemonFuego inherits Pokemon{
 	method ataqueLanzallamas(){}
 	method ataqueAscuas(){}
 	method ataquePuniofuego(){}
 }
 class PokemonAgua inherits Pokemon{
 	method ataqueHidroBomba(){}
 	method ataqueBurbuja(){}
 	method ataquePistolaAgua(){}
 }
 class PokemonHoja inherits Pokemon{
 	method ataqueDrenaje(){}
 	method ataqueHojaAfilada(){}
 	method ataqueLatigoCepa(){}
 }
 



const charmander = new PokemonFuego(front = "pokemons/charmanderFront.png",back="pokemons/charmanderBack.png",nombre="Charmander" )
const bulbasaur= new PokemonHoja(front ="pokemons/bulbasaurFront.png",back="pokemons/bulbasaurBack.png",nombre="Bulbasaur" )
const squirtle= new PokemonAgua(front="pokemons/squirtleFront.png",back="pokemons/squirtleBack.png",nombre="Squirtle")