class ExcepcionNoExisteMetodo < NoMethodError
  
  def initialize(method_name)
    @method_name = method_name
  end
  
  def to_s
    return "#{@method_name} no está soportado por el objeto controlado"
  end
end