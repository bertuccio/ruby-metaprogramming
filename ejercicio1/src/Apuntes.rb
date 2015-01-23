require 'FechasInterfaz'

class Apuntes
  
  include Comparable
  include FechasInterfaz
 
  attr :fechaComienzo
  
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
  
#  def initialize(descripcion, texto, fechaComienzo)
#    @descripcion = descripcion
#    @texto = texto
#    @fechaComienzo = fechaComienzo
#    @numHorasDedicacion = 0
#  end
  
  def initialize(descripcion, texto, fechaComienzo, numHoras)
    @descripcion = descripcion
    @texto = texto
    @fechaComienzo = fechaComienzo
    @numHorasDedicacion = numHoras
  end
  
  attr_reader :descripcion
  
#  def fechaComienzo=(fecha)
#    @fechaComienzo = fecha
#  end

  def contains(elemento)
    return self == elemento
  end
  
#  def numHorasDedicacion=(num)
#    @numHorasDedicacion = num
#  end

  
  def to_s
    s = '+Apuntes: ' + @descripcion.to_s + ' comienzo: ' +
      @fechaComienzo.to_s + ' horas: ' +@numHorasDedicacion.to_s
    return s
  end
  

  def == (other)
      @descripcion == other.descripcion 
  end
  

end