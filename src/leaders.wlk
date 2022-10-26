import wollok.game.*
import red.*
import backPack.*

class Leader{
	var property position
	var property image
	var property giftItem = false
}
class leon inherits Leader{
	
	method collidWithCharacter(){
		red.collidWithHitbox()
		if (!giftItem){
			giftItem = true
			healingPotion.addUnits(1)
			game.say(self,"leon: toma esto: +1(poti de vida)")
			game.say(self,"leon: ven despues de batallar")		
			
		}
	}
}
class alete inherits Leader{
	
	method collidWithCharacter(){
		red.collidWithHitbox()
		if (!giftItem){
			giftItem = true
			apple.addUnits(2)
			game.say(self,"alete: toma esto:+2(manzana)")
			game.say(self,"alete: te veo despues panflin")
		}
	}
	
}
class lucas inherits Leader{
	var items = [rareCandy,damangeX]
	
	method collidWithCharacter(){
		var randomItem = items.anyOne()
		
		red.collidWithHitbox()
		if (!giftItem){
			giftItem = true
			randomItem.addUnits(1)
			game.say(self,"lucas:toma esto:+1"+randomItem.name())
			game.say(self,"lucas:vuelve mas tarde")
		}
	}
}

//Ojo cambiar a .png cuando cambiamos la imagen
const leon = new leon(position = game.at(26, 17), image = "trainerImages/leon.png")
const alete = new alete(position = game.at(49, 30), image = "trainerImages/alete.png")
const lucas = new lucas(position = game.at(33, 32), image = "trainerImages/lucas.png")



