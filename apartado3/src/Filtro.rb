class Filtro
  
  def initialize(nombre, columna, bloque)
    @nombre = nombre
    @columna = columna
    @bloque = bloque
    @activado = true
  end
  
  attr_reader :nombre
  attr_reader :columna
  attr_reader :bloque
  attr_reader :activado
  
  def == (other)
      @nombre == other.nombre
  end
  
  def activar
    @activado = true
  end
  
  def desactivar
    @activado = false
  end
  
  def to_s
      return "#{nombre}"
  end
  
end