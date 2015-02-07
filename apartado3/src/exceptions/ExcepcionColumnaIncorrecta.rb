class ExcepcionColumnaIncorrecta < ArgumentError
  
  def initialize(info)
    @info = info
  end
  
  def to_s
    
    return "Error al añadir fila a la tabla, columna #{@info} incorrecta"
  end
  
end