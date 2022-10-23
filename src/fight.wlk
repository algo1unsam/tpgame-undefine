 import pokemon.*
 import menu.*
 import screen.*
 import red.*
 import map.*
 import wollok.game.*
 
 
 //clase pelador contiene el nombre del pokemon salvaje que pela y una lista de ataques y de carteles 
 class Fighter{
 	var property name //inicializamos oponente aleatorio o pokemon de red
 	const attacks = [name.attack1(),name.attack2(),name.attack3(),name.attack4()] //lista de ataques del pokemon
 	const signs = [] //listade carteles de ataques
	const property position

	//iniscializa la lista de carteles 	
 	method initialiteSigns(){
 		(4.times{i => self.addSing(i)})
 	}
 	//instancia el cartel
 	method instanceSign(i){
 		//la ruta esta conformada por el tipo de pokemon (con la primera letra en mayuscula) y el numero de ataque
 		//ej : "maps/attackFire1.png"
 		const pathSign = "maps/attack"+name.type()+i.toString()+".png" 
 		return new BattleObject(image = pathSign)
 	} 
 	//agrega la instancia del cartel a la lista de carteles
 	method addSing(i){
 		signs.add(self.instanceSign(i))
 	}
 	
 	//funcion que muestra el cartel	
	method atackSign(atack){
		if(!game.hasVisual(atack)){
			game.addVisualIn(atack, game.at(5, 1))
			game.schedule(3000, { game.removeVisual(atack) })			
		}
	}
	method figtherDead(){
 		game.addVisualIn(crossDead,position)
 		game.schedule(6000, {flight.itIsInside()}) //saca del juegp
 	}
}
//luhcador robot tiene los metodos para generar pelea 
class FighterBot inherits Fighter{
	//realiza un ataque de forma aleatoria
 	method randomAttack(){
 		const random = 0.randomUpTo(3).truncate(0) //random del 0 al 3
 		
 		game.schedule(4000, {self.atackSign(signs.get(random))})//Cartel de ataque 		
 		return attacks.get(random) //ejecuta el ataque
 	}
	override method figtherDead(){
 		super()
 		map1.mapPokemons().remove(name)	
 	}
 }
 
 class FighterRed inherits Fighter{
 	
 	//realiza el ataque segun la opcion elegida la cual esta dada por el arrow.bloq le quitamos 1 ya que block va del 1 al 4
 	method attackFromOption(option){	
 		self.atackSign(signs.get(option-1)) //imprime el cartel del ataque a ejecutar
 		return attacks.get(option-1)
 	}
 }
 
 object battle{
 	method twinkle(pokemon, pos){
		game.removeVisual(pokemon)
		game.schedule(50, { game.addVisualIn(pokemon, pos) })
		game.schedule(100, { game.removeVisual(pokemon) })
		game.schedule(200, { game.addVisualIn(pokemon, pos) })
		game.schedule(250, { game.removeVisual(pokemon) })
		game.schedule(300, { game.addVisualIn(pokemon, pos) })
	}
	//cuando muere un pokemon
	method pokemonDead(fighter){
		if (fighter.name().isDead()){
			fighter.figtherDead()
		}
	}
	//metodo para que red espere su turno
	method redWait(waitTime){
		arrow.superRestriction(true) //blqueamos el uso de la flecha
		arrow.relesRestriction(false, true, true, false, game.at(38, 6))//volvemos a colocar las restricciones iniciales
		game.removeVisual(arrow)	
		game.schedule(waitTime, {arrow.superRestriction(false)})// en x tiempo volvemos a dar uso de la flecha
		game.schedule(waitTime, {game.addVisual(arrow)}) //añadimos la flecha
	}
	
	method attackScene(optionRed){
		const waitTimeTurn = 8000 //tiempo de espera para el turno
		
		botFighter.name().takeDamage(fighterRed.attackFromOption(optionRed))//El oponente recibe daño
		self.pokemonDead(botFighter)
		self.redWait(waitTimeTurn)
		self.twinkle(botFighter.name(), botFighter.position())//Titila el oponente cuando le doy 1 golpe
		fight.back()//vuelve al menu de seleccion de modo
		fighterRed.name().takeDamage(botFighter.randomAttack())
		game.schedule(4000, {self.pokemonDead(fighterRed)})
		game.schedule(4000, { self.twinkle(fighterRed.name(),fighterRed.position()) })//Titila nuestro pokemon luego de 4 segundos ya que 
	}
 }
 const botFighter = new FighterBot(name = map1.mapPokemons().anyOne(),position = game.at(37,18))
 const fighterRed = new FighterRed(name = red.fight(),position = game.at(8,8))
 
 