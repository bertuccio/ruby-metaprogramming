class Asignatura
  
  def initialize(nombre,nif,email)
    # Instance variables
    @nombre = nombre
    @nif = nif
    @email = email 
    @elementos = nil
    @fechaComienzo = nil
  end
  
  def to_s
    s = '+Asignatura: ' + @nombre.to_s + ', ' + @nif.to_s + 
      ', ' + @email.to_s + ', ' + @fechaComienzo.to_s
    unless @elementos.nil?
      s += "\n\t-" + @elementos.to_s
    end
    return s
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
    end
    unless @elementos.include?(elemento)
    end
    @elementos.push(elemento)
  end
  
end

