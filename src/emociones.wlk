import individuos.*
import eventos.*
class Emocion {
	var intensidad
	const property color
	
	method intensidad() = intensidad
	method intesidad(unValor) {
		intensidad += unValor
	}
	method puedeSerLiberada() = intensidad >= configuracion.valor()
	method expresar() { 
		if (self.puedeSerLiberada())
			self.disminuirIntensidad()	
	}
	method disminuirIntensidad()
	method esPromedio() = intensidad.between(50,75)
	
	//Parte 3
	method efecto(unEvento)
}

class Furia inherits Emocion {
	const palabrotas = []
	method agregarPalabrota(unaPalabrota){
		palabrotas.add(unaPalabrota)
	}
	override method puedeSerLiberada() {
		return super() && self.hayPalabrotaConMasDe(7)
	}
	
	method hayPalabrotaConMasDe(letras) {
		return palabrotas.any { palabrota => palabrota.size() > letras }
	}
	
	override method disminuirIntensidad() {
		intensidad = intensidad - self.maxLetras() 
	}
	 
	method maxLetras() {
		return palabrotas.max ({palabrota => palabrota.size()}).size()
	}
	
	override method efecto(unEvento) {
		self.intesidad(unEvento.impacto() * 1.5)
	}
	
}

class Alegria inherits Emocion {
	var eventosPositivos = 0
	method eventosPositivos()=eventosPositivos
	method sumarEventosPositivos(unaCantidad){
		eventosPositivos = 100.min( eventosPositivos + unaCantidad )
	}
	
	override method puedeSerLiberada() {
		return eventosPositivos.even() or super()
	}
	
	override method disminuirIntensidad() {
		intensidad = intensidad * (1 - eventosPositivos/100)
	}
	
	override method efecto(unEvento) {
		self.intesidad(unEvento.impacto())
		self.sumarEventosPositivos(1) 
	}
}

class Tristeza inherits Emocion {
	var property melancolica
	var property llorona
	
	override method puedeSerLiberada() {
		return melancolica or llorona
	}
	
	override method disminuirIntensidad() {
		intensidad = intensidad - if(color=="azul") 10 else 5
			
	}
	
	override method efecto(unEvento) {
		self.intesidad(unEvento.impacto() * 0.5)
		melancolica = true
		llorona = true		
	}
	
}

object configuracion {
	var property valor = 75
}