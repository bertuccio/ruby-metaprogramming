class Ejercicio
  def initialize(descripcion, fechaEntrega)
    @descripcion = descripcion
    @fechaEntrega = fechaEntrega
    @fechaComienzo = nil
    @numHoras = nil
  end
  include Descripcion
  def fechaComienzo=(fecha)
    @fechaComienzo = fecha
  end
  
  def == (other)

      @descripcion == other.descripcion 

  end
end