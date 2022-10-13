import pokemon.*
import red.*

object mochila{
	const artefactos=[]
	const capacidadMax=10
	
	method mochilaEstaLlena(){
		return (artefactos.size()<capacidadMax)
	}
	
	method agregarObjetoAMochila(objeto){
		if(objeto.size()<capacidadMax){
			artefactos.add(objeto)
		}	
	}
	method sacarObjetoDeMochila(objeto){
		artefactos.remove(objeto)
	}
	method usarObjetoDesdeMochila(pokemon){
		artefactos.forEach({objeto=>objeto.usarEnPokemon(pokemon)})
	}
	

}
object pocionCurativa{
	var property valorCuracion=500
	
	method usarEnPokemon(pokemon){
		pokemon.curarse(valorCuracion)
	}
} 
object carameloRaro{
	method usarEnPokemon(pokemon){
		pokemon.aumentarDeNivel()
	}
}
object pokeBall{
	method usarEnPokemon(pokemon){
		if (pokemon.estaDebil()){
			pokemon.serCapturado()
		}
	}
}
object repelente{
	method usarEnRed(){
		red.grassSteps(-100)
	}
}
