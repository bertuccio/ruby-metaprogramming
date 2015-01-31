require 'FechasInterfaz'

class Apuntes
  
  include Comparable
  include FechasInterfaz
 
  attr :fechaComienzo
  
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
    
  def initialize(descripcion, texto, fechaComienzo, numHoras)
    @descripcion = descripcion
    @texto = texto
    @fechaComienzo = fechaComienzo
    @numHorasDedicacion = numHoras
  end
  
  attr_reader :descripcion
  
  def contains(elemento)
    return self == elemento
  end
  
  def descarga
    File.open(@descripcion.to_s+".txt","w") do |file|
      file.puts @texto
    end
  end
  
  
  def print(indent)
    printf self.to_s
    printf("\n")
  end
  
  def to_s
    s = '+Apuntes: ' + @descripcion.to_s + ' comienzo: ' +
      @fechaComienzo.to_s + ' horas: ' +@numHorasDedicacion.to_s
    return s
  end
  
  def menu
    begin
      
      printf("0) descargar"+"\n")
      printf("1) volver"+"\n")
      printf "Introduce eleccion: "
      eleccion = gets
      if eleccion.to_i == 1
        break
      elsif eleccion.to_i == 0
        self.descarga
      end
    end while true
  end

  def == (other)
      @descripcion == other.descripcion 
  end
  

end