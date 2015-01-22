class Apunte
  def initialize(descripcion, texto)
    @descripcion = descripcion
    @texto = texto
    @fechaComienzo = nil
    @numHoras = nil
  end
  
  def fechaComienzo=(fecha)
    @fechaComienzo = fecha
  end
  
  def getDescripcion()
    put @descripcion
  end
end