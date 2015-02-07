class ExcepcionFilaIncorrecta < ArgumentError
  
  def initialize(info)
    @info = info
  end
  
  def to_s
    
    return "Error al añadir fila a la tabla, número de argumentos erróneo "+
      "(#{@info.size}) :\n\t#{@info}"
    
  end
  
end