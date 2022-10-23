 import pokemon.*
 import menu.*
 import screen.*
 import red.*
 import map.*
 import wollok.game.*
 
 class Fighter{
 	var property name //inicializamos oponente aleatorio o pokemon de red
 	const attacks = [name.attack1(),name.attack2(),name.attack3(),name.attack4()] //lista de ataques del pokemon
 	const signs = [] //listade carteles de ataques

	//iniscializa la lista de carteles 	
 	method initialiteSigns(){
 		(4.times{i => self.addSing(i)})
 	}
 	//instancia el cartel
 	method instanceSign(i){
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
	//realiza un ataque de forma aleatoria
 	method randomAttack(){
 		const random = 0.randomUpTo(3).truncate(0) //random del 0 al 3
 		
 		game.schedule(4000, {self.atackSign(signs.get(random))})//Cartel de ataque 		
 		return attacks.get(random) //ejecuta el ataque
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
 	method twinkle(pokemon, x, y){
		game.removeVisual(pokemon)
		game.schedule(50, { game.addVisualIn(pokemon, game.at(x,y)) })
		game.schedule(100, { game.removeVisual(pokemon) })
		game.schedule(200, { game.addVisualIn(pokemon, game.at(x,y)) })
		game.schedule(250, { game.removeVisual(pokemon) })
		game.schedule(300, { game.addVisualIn(pokemon, game.at(x,y)) })
	}

	
	method attackScene(optionRed){
		botFighter.name().takeDamage(fighterRed.attackFromOption(optionRed))//El oponente recibe daño
		self.twinkle(botFighter.name(), 37, 18)//Titila el oponente cuando le doy 1 golpe
		fight.back()//Se retira el cartel de ataque
		fighterRed.name().takeDamage(botFighter.randomAttack())
		game.schedule(4000, { self.twinkle(fighterRed.name(), 8, 8) })//Titila nuestro pokemon
	}
 }
 const botFighter = new Fighter(name = map1.mapPokemons().anyOne())
 const fighterRed = new FighterRed(name = red.fight())
 
 