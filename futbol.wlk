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

  method definirPorPenales(local, visitante) = [local, visitante].anyOne()


}

object river {
  var dineroEnCaja = 1000000
  var cantidadSocios = 100

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

object lali {
  method recaudacion() = 5000000
}

object karolG {
  method recaudacion() = lali.recaudacion()
}