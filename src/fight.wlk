 import pokemon.*
 import menu.*
 import screen.*
 import red.*
 import map.*
 import wollok.game.*
 
 
 //clase pelador contiene el nombre del pokemon salvaje que pela y una lista de ataques y de carteles 
 class Fighter{
 	var property name //inicializamos oponente aleatorio o pokemon de red
 	//IMPORTANTE: lista de ataque una vez inicializada quedan como valores constantes si el pokemon sube de nivel en batalla hay que volver a inicializar la lista
 	var property attacks = [name.attack1(),name.attack2(),name.attack3(),name.attack4()] //lista de ataques del pokemon
 	var property signs = [] //listade carteles de ataques
	const property lifeImage = []
	//devuelve el indice donde se encuentra la imagen de la vida 
	var property indexImageLife = null
	const property position
	//rutas incialez de los paths
	
	//iniscializa la lista de battleObjects de imagenes con numeros identificatorios,
	//pasando como parametro la cantidad de instancias, la ruta incial de imagen y el nombre de la lista
 	method initialiteBattleObjects(iterations,path,nameList){
 		(iterations.times{i => self.addBattleObjectList(i,path,nameList)})
 	}
 	//instancia el battleObject con la imagen 
 	method instanceBattleObjectWhitPath(i,path){
 		const completePath = path+i.toString()+".png" 
 		return new BattleObject(image = completePath)
 	} 
 	//agrega la instancia del cartel a la lista de carteles
 	method addBattleObjectList(i,path,nameList){
 		nameList.add(self.instanceBattleObjectWhitPath(i,path))
 	}
 	
 	//funcion que muestra el cartel	
	method sign(sign){
		if(!game.hasVisual(sign)){
			game.addVisualIn(sign, game.at(5, 1))
			game.schedule(3000, { game.removeVisual(sign) })			
		}
	}
	method figtherDead(){
 		game.addVisualIn(crossDead,position)
 		game.schedule(3999, {flight.itIsInside()}) //saca del juegp
 	}
 	//retorna una lista de 0 hasta la vida del pokemon con un salteado dado por la sigiente formula
 	//vida/cantidadImagenesDeVida
 	method listRangeLife(){
 		const step = self.name().topLife()/lifeImage.size()
 		const start = 0
 		const end = self.name().topLife()
 		
 		return new Range(start = start,end = end,step=step).asList()
 	}
 	//devuelve los numeros los cuales se vana  cmoparar con la vida del pokemon
 	method getBettwenNumers(){
 		const listRange = self.listRangeLife()
 		const iterates = lifeImage.size()
 		
 		iterates.times{i => self.isBetween(listRange.get(i-1),listRange.get(i),i-1)}
 	}
 	//verifica si la vida del pokemon esta entre los valores dados
 	method isBetween(start,end,index){
 		//le sumo 2 a end por el margen de error que genera la creacion de la llista con rango
 		if (self.name().life().between(start,end+2)){
 			indexImageLife = index
 		}
 	}
 	//actauliza el cartel de la vida en la posicion correspondiente
 	method refreshLifeSign(pos){
 		self.getBettwenNumers()
 		game.removeVisual(lifeImage.find{battleObject => game.hasVisual(battleObject)})
 		game.addVisualIn(lifeImage.get(indexImageLife),pos)
 	}
}
//luhcador robot tiene los metodos para generar pelea 
class FighterBot inherits Fighter{
	//realiza un ataque de forma aleatoria
 	method randomAttack(){
 		const random = 0.randomUpTo(3).truncate(0) //random del 0 al 3
 		
 		game.schedule(4000, {self.sign(signs.get(random))})//Cartel de ataque 		
 		return attacks.get(random) //ejecuta el ataque
 	}
 	//asigna un nivel random al pokemon salvaje realizando una dif contra el lvl de pokemon de red
 	method randomLevel(difMax){
 		const lvlPokRed = fighterRed.name().level()
 		const random = (lvlPokRed-difMax).max(0).randomUpTo(lvlPokRed+difMax)
 		name.level(random)
 	}
	override method figtherDead(){
 		super()
 		map1.mapPokemons().remove(name)	
 	}
 	
 }
 
 class FighterRed inherits Fighter{
 	
 	//realiza el ataque segun la opcion elegida la cual esta dada por el arrow.bloq le quitamos 1 ya que block va del 1 al 4
 	method attackFromOption(option){	
 		console.println(self.signs().map{i => i.image()})
 		console.println(option-1)
 		self.sign(signs.get(option-1)) //imprime el cartel del ataque a ejecutar
 		return attacks.get(option-1)
 	}
 	//la variable de ataques necestia ser refrezcada cuando el nivel sube ya que si no no se efectua el cambio
 	method refreshAttacks(){
 		const list = [name.attack1(),name.attack2(),name.attack3(),name.attack4()]
 		attacks.clear()
		attacks.addAll(list)
	}
 	//metodo para refrezcar el nivel si en batalla le dan al pokemon un caramelo raro de la mochi
	method refreshLV(){
		self.refreshAttacks()
		game.removeVisual(lvPokemonRed)
		lvPokemonRed.image("maps/lv/"+self.name().level().toString()+".png")
		game.addVisualIn(lvPokemonRed,battleScreen.redPos().get(2))//TODO:agregar ubicacion real
	}
	//validaciones
	method pokemonNeedLife(){
		if (self.name().isDead()){
			game.sound("sounds/notItem.mp3").play()
			self.error("el pokemon necesita vida")
		}
	}
 }
 
 object battle{
 	method twinkle(pokemon, pos){
		game.removeVisual(pokemon)
		game.schedule(50, { game.addVisualIn(pokemon, pos) })
		game.schedule(100, { game.removeVisual(pokemon) })
		game.schedule(150, { game.addVisualIn(pokemon, pos) })
		game.schedule(200, { game.removeVisual(pokemon) })
		game.schedule(250, { game.addVisualIn(pokemon, pos) })
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
		
		fighterRed.pokemonNeedLife()
		botFighter.name().takeDamage(fighterRed.attackFromOption(optionRed))//El oponente recibe daño
		botFighter.refreshLifeSign(battleScreen.botPos().get(0))
		game.sound("sounds/hit.mp3").play()
		self.pokemonDead(botFighter)
		self.redWait(waitTimeTurn)
		self.twinkle(botFighter.name(), botFighter.position())//Titila el oponente cuando le doy 1 golpe
		fight.back()//vuelve al menu de seleccion de modo
		fighterRed.name().takeDamage(botFighter.randomAttack())
		game.schedule(4000, {fighterRed.refreshLifeSign(battleScreen.redPos().get(0))})
		game.schedule(4000, {game.sound("sounds/hit.mp3").play()})
		game.schedule(4000, {self.pokemonDead(fighterRed)})
		game.schedule(4000, {self.twinkle(fighterRed.name(),fighterRed.position()) })//Titila nuestro pokemon luego de 4 segundos ya que 
		
	}
 }
 const botFighter = new FighterBot(name = map1.mapPokemons().anyOne(),position = game.at(37,18))
 const fighterRed = new FighterRed(name = red.fight(),position = game.at(8,8))
 
 