
object springfield {
	var velocidadVientos = 10
	var riquezaSuelo = 0.9
	var suministro = 15
	
	var centrales = #{burns,exBosque,elSuspiro}	
	
	method riquezaSuelo(){
		return riquezaSuelo
	}
	
	method velocidadVientos(){
		return velocidadVientos
	}

	method centralesContaminantes(){ //nofunca
		return centrales.filter({central => central.contamina() })
	}
	
	method cubreNecesidades(necesidades){
		return suministro > necesidades
	}
	
/*	method estaEnElHorno(){
		return self.centralesTodasContaminantes() || self.centralesContaminantesAportanMasDel50()
	}
	
	method centralesTodasContaminantes(){
		return centrales.all({central => central.contamina()})
	}
	
	method centralesContaminantesAportanMasDel50(){
		var contaminantes = self.centralesContaminantes()
	}
*/ }

	

// Centrales
object burns{
	var varillasDeUranio = 10
	
	method produccionEnergetica(){
		return 0.1 * varillasDeUranio
	}
	
	method contamina(){
		return varillasDeUranio > 20 
	} 	
}

object exBosque{
	var capacidadToneladas 
	var ciudad = springfield
	
	method produccionEnergetica(){
		return 0.5+ capacidadToneladas * ciudad.riquezaSuelo()
	}
	
	method contamina(){
		return true  
	} 	
}

object elSuspiro{
	var turbinas = [(0.2)]
	var ciudad = springfield

	method produccionesTurbinas(){
		return turbinas.sum()		
	}
	
	method produccionEnergetica(){
		return 0.5+ (self.produccionesTurbinas() * ciudad.velocidadVientos())
	}

	method contamina(){
		return false  
	}
	
}



/*Central Atómica “Burns”
Central de carbón “Ex-bosque”
Central Eólica “El Suspiro”
 */