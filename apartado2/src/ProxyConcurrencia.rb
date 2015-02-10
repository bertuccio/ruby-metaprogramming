require 'exceptions/ExcepcionArgumentosNoValidos'
require 'exceptions/ExcepcionNoExisteMetodo'
require 'exceptions/ExcepcionRecursoBloqueado' 
  
class ProxyConcurrencia
  
  def initialize(objeto)
    @objeto = objeto
    @usuario = nil
  end
  
  def bloqueaRecurso(usuario)
    @usuario = usuario
  end
  
  def liberaRecurso(usuario)
    @usuario = nil
  end
  
  
  def method_missing(method_name, usuario, *args)
     

    if not @usuario == usuario
      raise ExcepcionRecursoBloqueado.new(usuario)
    end
    
    if not @objeto.respond_to? method_name
      raise ExcepcionNoExisteMetodo.new(method_name)
 
    elsif not args.length == @objeto.method(method_name).arity.abs
      raise  ExcepcionArgumentosNoValidos.new(method_name)
    end
        
    ProxyConcurrencia.send(:define_method, method_name) do |usuario,*args|
      
       @objeto.send(method_name, *args)     
    end

    @objeto.send(method_name, *args)

  end

    
    
end