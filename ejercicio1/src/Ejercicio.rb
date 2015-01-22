class Ejercicio
  def initialize(descripcion, fechaEntrega)
    @descripcion = descripcion
    @fechaEntrega = fechaEntrega
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