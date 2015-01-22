class Apuntes
  
  
  def initialize(descripcion, texto, fechaComienzo)
    @descripcion = descripcion
    @texto = texto
    @fechaComienzo = fechaComienzo
    @numHoras = nil
  end
  
  def to_s
    s = '+Apuntes: ' + @descripcion.to_s + ', ' + @texto.to_s + 
      ', ' + @fechaComienzo.to_s
    return s
  end
  
  def fechaComienzo=(fecha)
    @fechaComienzo = fecha
  end

  def contains(elemento)
    return self == elemento
  end
  
    
  def == (other)
      @descripcion == other.descripcion 
  end
  
  def fechaComienzo()
    @fechaComienzo
  end
  
  attr_reader :descripcion
end