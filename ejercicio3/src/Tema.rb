require 'FechasInterfaz'
class Tema
  
  include Comparable
  include FechasInterfaz

  attr :fechaComienzo
  attr :elementos
 
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
  
  def initialize(descripcion)
    @descripcion = descripcion
    @elementos = nil
    @fechaComienzo = nil
    @numHorasDedicacion = nil
  end
  
  attr_reader :descripcion

  def fechaComienzo
    if @fechaComienzo.nil?
      unless @elementos.nil?
        fechas = Array.new
        @elementos.each{|elemento| fechas.push(elemento.fechaComienzo)}
        fechas.sort!{|e1, e2| e1 <=> e2}
        @fechaComienzo = fechas.first
        return fechas.first
      end
      @fechaComienzo = Time.now.to_date
      return Time.now.to_date
    end
    return @fechaComienzo
  end
  
  def contains(elemento)
    unless @elementos.nil?
      if @elementos.empty? 
            return false
      else
        logic = false
        @elementos.each{|x| 
          if x.contains(elemento)
            return true
          end
          }
        return false
      end
    end
    return self == elemento
  end
  
  def addElemento(elemento)
    if @elementos.nil?
      @elementos = Array.new
      @elementos.push(elemento)
    else
      if contains(elemento)
        puts "Elemento duplicado: " + elemento.to_s
        return
      else
        if elemento.is_a? Tema
          unless elemento.elementos.nil?
            elemento.elementos.each{|x|
              if self.contains(x)
                puts "Elemento duplicado: " + x.to_s
                return
              end
            }
          end
        end
        @elementos.push(elemento)
      end
    end
  end
  
  def print(indent)
    printf self.to_s
    printf "\n"
    unless @elementos.nil?
    
      localindent = indent
      indent +=1
      @elementos.sort.each{|x|  
        i = 0
        while i < localindent
          printf "\t"
          i +=1
        end
        x.print(indent)}
    end
  end
  
  def to_s
    s = '+Tema: ' + @descripcion.to_s + ', ' + @fechaComienzo.to_s + ' horas: ' +@numHorasDedicacion.to_s
#    unless @elementos.nil?
#      s += "\n\t-" + @elementos.sort.to_s
#    end
    return s
  end
  
  def == (other)
      @descripcion == other.descripcion 
  end
end