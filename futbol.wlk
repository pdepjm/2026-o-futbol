import jugadores.*

object referi {
  method quienGanaEntre(local, visitante) {
    const golesLocal = local.goles(visitante)
    const golesVisitante = visitante.goles(local)

    if (golesLocal == golesVisitante){
      return self.definirPorPenales(visitante, local)
    }

    return if(golesLocal > golesVisitante) local else visitante 
  }

  //method tieneMasGoles() = if(1 > 2) "epico" else "epic fail" 

  method definirPorPenales(local, visitante) = [local, visitante].anyOne()
}

object river {
  var dineroEnCaja = 1000000
  var cantidadSocios = 100

  method dineroEnCaja() = dineroEnCaja //Getter
  method dineroEnCaja(nuevoDinero) {
    dineroEnCaja = nuevoDinero //Setter
  }

  method hacerConcierto(concierto) {
    dineroEnCaja += concierto.recaudacion()
  }

  method dinero() = dineroEnCaja + cantidadSocios * 13000
  method goles(rival) = (self.dinero() - rival.dinero()).div(1000000)
  


  method hinchas() = 10000 + cantidadSocios * 2
  method capacidadOfensiva() = self.dinero() / 10000
}

object barracas {
  method goles(rival) = rival.goles(self) + 1
  method dinero() = 1000000  
  method hinchada() = 800
  method capacidadOfensiva() = 5
}

object boca {
  const ingresos = [1000000, 30000, 1500] //Listas: Ordenada, se pueden repetir elementos 
  const deudas = [30000]
  const jugadores = #{cachoPanceta, francoFranco} //Conjuntos / Sets: No ordenada, no se pueden repetir 

  // Agrego una cantidad de dinero como ingreso
  method transferencia(dinero) {
    ingresos.add(dinero)
  }

  method venderJugador(jugador) {
    if(jugadores.contains(jugador)) {
      jugadores.remove(jugador)
      self.transferencia(jugador.valor())
    }
  }

  method dinero() = ingresos.sum() - deudas.sum()

  method capacidadOfensiva() = if(self.estaEnUnMalMomento()) 25 else 40

  method estaEnUnMalMomento() = deudas.size() * 2 > ingresos.size()

  method goles(rival) = 1 + self.diferenciaDeGoles(rival).div(3)

  /* ---------- Rotura de Encapsulamiento ----------
  method golesWorse(rival) = 1 + rival.dineroEnCaja() * rival.cantidadSocios()
  
  method prestigiosidad() = (river.dineroEnCaja() / 10 + river.cantidadSocios() * 2) * 2 // river.vaBien() => Better 
  */

  method hinchada() = 54000

  method diferenciaDeGoles(rival) = self.capacidadOfensiva() - rival.capacidadOfensiva() 
}

object velez {
  const jugadores = [francoFranco, miguelFugaz]

  method jugadorFigura() = jugadores.head()
  
  method dinero() = jugadores.map({jugador => jugador.valor()}).sum()
  method capacidadOfensiva() = jugadores.filter({jugador => jugador.habilidad().even()}).size()
  method hinchada() = self.jugadorFigura().habilidad() * 2000
  method goles(rival) =  if(self.capacidadOfensiva() > rival.capacidadOfensiva()) 3 else 1
  
  method diaPractica() {jugadores.forEach({jugador => jugador.entrenar()})}
}

object lali {
  method recaudacion() = 5000000
}

object karolG {
  method recaudacion() = lali.recaudacion()
}