import wollok.game.*
import red.*
import screen.*


//Map tiene mucha relación con screen, pueda que cualquier cambio haya que reflejarlo en screen


//mapa inicial
class InitialMap{	
	const property image  //imagen del mapa
	const listOfInvisibleObjects = []
	/*crea una bloque o linea de objetos invisibles con posiciones desde [initX,endX)(desde izqquierda a derecha eje x)
	  y [initY,endY) (desde arriba hacia abajo ejeY)
	 ej: metohd createLineOfCollidersInX(initX=1,endx=10,initY=2,endY=0)
	 	 va a inicializar un boque de objetos invisibles con las siguientes posiciones
	 	 (1,2), (2.2),(3,2)(4,2),(5,2),(6,2),(7,2),(8,2),(9,2)
	 	 (1,1), (2.1),(3,1)(4,1),(5,1),(6,1),(7,1),(8,1),(9,1)*/
	method createBloqueInvisibleObjects(initX,endX,initY,endY,nameObjectInstance){
		(initY-endY).times{countY => (endX-initX).times{countX => self.addListInvisibleObject(initX+(countX-1),initY-(countY-1),nameObjectInstance)}}
	}
	//instancia colliders genericos contra los que choca
	method addListInvisibleObject(x,y,nameObjectInstance){
		listOfInvisibleObjects.add(nameObjectInstance.instance(x,y))
	}
	//crea los los objetos invisibles en las posisiciones que el mapa requiera
	method constructInvisibleNormalObjects(){
		//Instanciando normalObjects
		self.createBloqueInvisibleObjects(25, 39, 21, 19,instanceHitbox)
		self.createBloqueInvisibleObjects(4, 9, 21, 19,instanceHitbox)
		self.createBloqueInvisibleObjects(3,4,34, 1,instanceHitbox)	
		self.createBloqueInvisibleObjects(4, 30, 2, 1,instanceHitbox)
		self.createBloqueInvisibleObjects(35, 59, 2, 1,instanceHitbox)
		self.createBloqueInvisibleObjects(29, 30, 2, -1,instanceHitbox)
		self.createBloqueInvisibleObjects(35, 36, 2, -1,instanceHitbox)
		self.createBloqueInvisibleObjects(55, 56, 34, 2,instanceHitbox)
		self.createBloqueInvisibleObjects(4, 30, 12, 10,instanceHitbox)
		self.createBloqueInvisibleObjects(20, 24, 29, 23,instanceHitbox)
		self.createBloqueInvisibleObjects(4, 24, 32,31,instanceHitbox)
		self.createBloqueInvisibleObjects(35, 56, 32, 31,instanceHitbox)
		//instanicaindo GrassObjects
		self.createBloqueInvisibleObjects(30,44,12,8,instanceHitboxGrass)
		self.createBloqueInvisibleObjects(10,22,5,3,instanceHitboxGrass)
		self.createBloqueInvisibleObjects(43,50,5,3,instanceHitboxGrass)
		self.createBloqueInvisibleObjects(40,54,21,17,instanceHitboxGrass)
		self.createBloqueInvisibleObjects(25,54,27,23,instanceHitboxGrass)	
	}
	//agrega los visuales en el mapa
	method addVisualInBoard(){
		listOfInvisibleObjects.forEach{objects => objects.showInBoard()}
	}
}
//creamos objetos que generan la instancia de los hitbox para no repetir codigo en el mapa
object instanceHitbox{
	method instance(x,y){
		return new HitBox(position=game.at(x,y))
	}
}
object instanceHitboxGrass{
	method instance(x,y){
		return new HitBoxGrass(position=game.at(x,y))	
	}
}

class HitBox{
	var property position	// Posiciono los objetos para que colisionen
	//var property image = "red/ash3.jpg" // Establezco una imagen para saber donde esta el objeto noramal que sera invisibile
	
	method showInBoard(){
		game.addVisual(self)
	}
	method collidWithCharacter(){
		red.collidWithHitbox()
	}
}

class HitBoxGrass inherits HitBox{
	override method collidWithCharacter(){
		red.stepOnGrass()
	}

}
//Mapa de presentacion
const map1 = new InitialMap (image = "maps/map1.jpg")
const battle = new InitialMap (image = "maps/gardenBG.png")


