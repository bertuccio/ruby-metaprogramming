require 'FechasInterfaz'
class Ejercicio
  
  include Comparable
  include FechasInterfaz
  
  attr :fechaComienzo
  
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
  

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

  def contains(elemento)
    return self == elemento
  end

  
  def == (other)
      @descripcion == other.descripcion 
  end
  
  def print(indent)
    printf self.to_s
    printf("\n")
  end
  
  def descarga
    File.open(@descripcion.to_s+".txt","w") do |file|
      @apartados.each(){|a|
        file.puts("Puntiación: "+a.puntuacion.to_s)
        file.puts  a.enunciado
      }
    end
  end
  
  def entrega
    
    printf "Introduce el nombre del fichero junto con su extensión: "
    file = gets.chomp 
    copyFile(FileUtils.getwd().to_s, file)
    
  end
  
  def copyFile(path, file)
    
    dest = "entregas/"+@descripcion.to_s+"/"
    FileUtils.mkdir_p dest
    puts dest
    dest += file
    source = path.to_s + "/" + file.to_s
    puts source
    
    if File.exist?(source.to_s)
      if File.exist?(dest.to_s)
        puts("No se puede sobreescribir el fichero: "+ file.to_s)
      else
        FileUtils.cp_r(source.to_s, dest.to_s)
      end    
    else
      puts("No existe el fichero: "+ file.to_s)
    end
  end
  
  def menu
    begin
      printf("0) descargar"+"\n")
      printf("1) entrega"+"\n")
      printf("2) volver"+"\n")
      printf "Introduce eleccion: "
      eleccion = gets
      if eleccion.to_i == 2
        break
      elsif eleccion.to_i == 1
        if Date.today < @fechaEntrega
          self.entrega
        else
          puts "Plazo terminado "
        end      
      elsif eleccion.to_i == 0
        self.descarga
      end
    end while true
  end
  
  def to_s
    s = '+Ejercicio: ' + @descripcion.to_s + ' comienzo: ' + @fechaComienzo.to_s + 
      ' entrega: ' + @fechaEntrega.to_s +
      ' horas: ' +@numHorasDedicacion.to_s
    return s
  end

end

#Test 

#require 'Apartado'
#require 'date'
#
#a = Apartado.new('enunciado1',1)
#begin
#  #Añade una fecha incorrecta
#  e = Ejercicio.new('ejercicio1',Date.new(2015,2,13),Date.new(2015,1,15),a,5)
#  rescue ArgumentError
#    puts $!
#  ensure
#end
#
#begin
#  e = Ejercicio.new('ejercicio1',Date.new(2015,1,13),Date.new(2015,1,15),a,5)
#  puts e
#  #Añade un ejercicio como apartado (error)
#  e1 = Ejercicio.new('ejercicio2',Date.new(2015,1,13),Date.new(2015,1,15),e,5)
#rescue ArgumentError
#  puts $!
#ensure
#end


