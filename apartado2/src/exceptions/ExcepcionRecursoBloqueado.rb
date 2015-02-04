class ExcepcionRecursoBloqueado < Exception
  
  def initialize(usuario)
    @usuario = usuario
  end
  
  
  def to_s
    return "#{@usuario} no ha bloqueado el recurso"
  end
  
end