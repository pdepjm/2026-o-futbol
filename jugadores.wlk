object cachoPanceta {
  method valor() = 8000000
  method habilidad() = 8
}

object elPerroGutierrez {
  method valor() = 5000000
  method habilidad() = 9
}

object miguelFugaz {
  var partidosJugados = 30
  method jugarUnPartido() { partidosJugados += 1 }
  method valor() = partidosJugados * 100000
  method habilidad() = 6
}

object francoFranco {
  var edad = 36
  method cumplirAnios() { edad += 1 }
  method valor() = (40 - edad) * 500000
  method habilidad() = 7
}