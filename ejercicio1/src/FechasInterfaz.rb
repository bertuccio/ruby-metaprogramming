module FechasInterfaz
  
  def numHorasDedicacion
    if@numHorasDedicacion.nil?
      numHoras = 0
      unless @elementos.nil?
        @elementos.each{|elemento| 
          (numHoras += elemento.numHorasDedicacion)} 
      end
      @numHorasDedicacion = numHoras
      return numHoras
    end
    return @numHorasDedicacion
  end
  
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

end
