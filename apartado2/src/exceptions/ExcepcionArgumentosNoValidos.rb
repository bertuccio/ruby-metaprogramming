class ExcepcionArgumentosNoValidos < ArgumentError
  
  def initialize(method_name)
    @method_name = method_name
  end
  
  def to_s
    return "#{@method_name} llamado con número de argumentos erróneo"
  end
  
end