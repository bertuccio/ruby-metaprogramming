class Ejercicio
  
  def initialize(descripcion, fechaEntrega,fechaComienzo)
    @descripcion = descripcion
    @fechaEntrega = fechaEntrega
    @fechaComienzo = fechaComienzo
    @numHoras = nil
  end

  def fechaComienzo=(fecha)
    @fechaComienzo = fecha
  end
  
  def contains(elemento)
    unless @elementos.nil?
      if @elementos.empty? 
            return false
      else
        @elementos.inject{|logic,x| logic or x.contains(elemento)}
        return logic   
      end
    end
    return self == elemento
  end
  
  def == (other)
      @descripcion == other.descripcion 
  end
  
  def fechaComienzo()
    @fechaComienzo
  end
end