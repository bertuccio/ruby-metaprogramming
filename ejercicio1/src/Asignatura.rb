class Asignatura
  
  include Comparable
  
  attr :fechaComienzo
  
  def <=>(other)
    @fechaComienzo <=> other.fechaComienzo
  end
  
  def initialize(nombre,nif,email)
    # Instance variables
    @nombre = nombre
    @nif = nif
    @email = email 
    @elementos = nil
    @fechaComienzo = nil
  end
  
  attr_reader :descripcion
  
  def fechaComienzo()
    unless @elementos.nil?
      fechas = Array.new
      @elementos.each{|elemento| fechas.push(elemento.fechaComienzo())} 
      fechas.sort!{|e1, e2| e1 <=> e2}
      @fechaComienzo = fechas.first
      return fechas.first
    end
    @fechaComienzo = Time.now.to_date
    return Time.now.to_date
  end
  
  def contains(elemento)
    unless @elementos.nil?
      if @elementos.empty? 
            return false
      else
        logic = false
        @elementos.each{|x| logic = (logic or x.contains(elemento))}
        return logic   
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
      else
        @elementos.push(elemento)
      end
    end
  end
  
  def numHorasDedicacion
    numHoras = 0
    unless @elementos.nil?
      @elementos.each{|elemento| 
        (numHoras += elemento.numHorasDedicacion)} 
    end
    return numHoras
  end
  
  def to_s
    s = '+Asignatura: ' + @nombre.to_s + ', ' + @nif.to_s + 
      ', ' + @email.to_s + ', ' + @fechaComienzo.to_s
    unless @elementos.nil?
      s += "\n\t-" + @elementos.sort.to_s
    end
    return s
  end
  
  def == (other)
      @descripcion == other.descripcion 
  end
  
end

