import emociones.*
import eventos.*
class Individuo {
	var edad
	const emociones = []
	//Parte 3 - Eventos
	const property eventos = []
	
	
	method edad() = edad
	method esAdolecente() = edad.between(12, 18)
	
	
	method porExplotarEmocionalmente() {
		return emociones.all {emocion=> emocion.puedeSerLiberada() }
	}
	method deltaEmocional() {
		return self.maxIntesidad().intensidad() - self.minIntesidad().intensidad()
	}
	
	method maxIntesidad() {
		return emociones.max { emocion => emocion.intensidad() }
	}
	
	method minIntesidad() {
		return emociones.min { emocion => emocion.intensidad() }
	}
	
	method mapaCromatico() {
		return emociones.map({ emocion => emocion.color() }).asSet()
	}
	
	method energiaEmocional() {
		return self.emocionesPromedio().sum( { emocion => emocion.intensidad()})
	}
	
	method emocionesPromedio() {
		return emociones.filter { emocion => emocion.esPromedio()}
	}
	
	method expresarTodasLasEmociones() {
		emociones.forEach { emocion => emocion.expresar()}
	}
	
	//Parte 3 - Eventos
	method registrarEvento(unEvento){
		eventos.add(unEvento)
	}
	
	method procesarEventos() {
		eventos.forEach { evento=> self.procesar(evento) }
		eventos.clear()
	}
	
	method procesar(evento) {
		self.emocionesDeUnColor(evento.colorEmocional()).forEach {
			emocion => emocion.efecto(evento)
		}
	}
	
	method emocionesDeUnColor(unColor) {
		return emociones.filter({emocion => emocion.color() == unColor})
	}
	
}
