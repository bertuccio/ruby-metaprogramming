class Tema
  

  def initialize(descripcion)
    @descripcion = descripcion
    @elementos = nil
    @fechaComienzo = nil
  end

  def to_s
    s = '+Tema: ' + @descripcion.to_s + ', ' + @fechaComienzo.to_s
    unless @elementos.nil?
      s += "\n\t-" + @elementos.to_s
    end
    return s
  end
  
  def == (other)
      @descripcion == other.descripcion 
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
  
  def fechaComienzo()
    
    unless @elementos.nil?
      fechas = Array.new
      @elementos.each{|elemento| fechas.push(elemento.fechaComienzo())} 
      fechas.sort!{|e1, e2| e1 <=> e2}
      @fechaComienzo = fechas.first
      return fechas.first
    end
    return nil
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
end