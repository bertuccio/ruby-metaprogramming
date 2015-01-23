require 'FechasInterfaz'
class Ejercicio
  
  include Comparable
  include FechasInterfaz
  
  attr :fechaComienzo
  
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
  
  
#  def initialize(descripcion, fechaComienzo, fechaEntrega, apartado)
#    unless (apartado.is_a?(Apartado))
#      raise ArgumentError,
#              "El elemento: " + apartado.to_s + " no es de tipo Apartado",
#              caller
#    end
#    if (fechaComienzo > fechaEntrega)
#      raise ArgumentError,
#              "La fecha de comienzo debe ser antes que la fecha de entrega",
#              caller
#    end
#    @descripcion = descripcion
#    @fechaEntrega = fechaEntrega
#    @fechaComienzo = fechaComienzo
#    @numHorasDedicacion = 0
#    @apartados = Array.new
#    @apartados.push(apartado)
#  end
#  
  def initialize(descripcion, fechaComienzo, fechaEntrega, apartado, numHoras)
    unless (apartado.is_a?(Apartado))
      raise ArgumentError,
              "El elemento: " + apartado.to_s + " no es de tipo Apartado",
              caller
    end
    if (fechaComienzo > fechaEntrega)
      raise ArgumentError,
              "La fecha de comienzo debe ser antes que la fecha de entrega",
              caller
    end
    @descripcion = descripcion
    @fechaEntrega = fechaEntrega
    @fechaComienzo = fechaComienzo
    @numHorasDedicacion = numHoras
    @apartados = Array.new
    @apartados.push(apartado)
  end
  
  attr_reader :descripcion
  
  def addApartado(apartado)
    if (apartado.is_a?(Apartado))
      @apartados.push(apartado)
    end
  end

#  def fechaComienzo=(fecha)
#    @fechaComienzo = fecha
#  end
  
  def contains(elemento)
    return self == elemento
  end
  
#  def numHorasDedicacion=(num)
#    @numHorasDedicacion = num
#  end

  
  def == (other)
      @descripcion == other.descripcion 
  end
  
  def to_s
    s = '+Ejercicio: ' + @descripcion.to_s + ' comienzo: ' +
      @fechaComienzo.to_s + ' horas: ' +@numHorasDedicacion.to_s
    return s
  end

end

#Test 

require 'Apartado'
require 'date'

a = Apartado.new('enunciado1',1)
begin
  #Añade una fecha incorrecta
  e = Ejercicio.new('ejercicio1',Date.new(2015,2,13),Date.new(2015,1,15),a,5)
  rescue ArgumentError
    puts $!
  ensure
end

begin
  e = Ejercicio.new('ejercicio1',Date.new(2015,1,13),Date.new(2015,1,15),a,5)
  puts e
  #Añade un ejercicio como apartado (error)
  e1 = Ejercicio.new('ejercicio2',Date.new(2015,1,13),Date.new(2015,1,15),e,5)
rescue ArgumentError
  puts $!
ensure
end


