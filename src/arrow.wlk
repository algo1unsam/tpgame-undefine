import wollok.game.*

//Flechita para el menu
object arrow{
	const property image = "maps/arrow.png"
	var property position = game.at(38, 6)
	
	method right() {
		position = position.right(2)
		//Agregar sonido aca
	}
	
	method left() {
		position = position.left(2)
		//Agregar sonido aca
	}
	
	method up() {
		position = position.up(2)
		//Agregar sonido aca
	}
	
	method down() {
		position = position.down(2)
		//Agregar sonido aca
	}
	

}