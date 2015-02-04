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
    
    puts "missing"
    
    if not @usuario == usuario
      raise ExcepcionRecursoBloqueado.new(usuario)
    end
    
    if not @objeto.respond_to? method_name
      raise ExcepcionNoExisteMetodo.new(method_name)
    elsif not args.length == @objeto.method(method_name).arity
      raise  ExcepcionArgumentosNoValidos.new(method_name)
    end
    
    @objeto.send(method_name, *args)
    #

#             define_method(method_name) { puts args.length }
          
   #
   
#      define_method(method_name) do |*arg|                  
#        @objeto.method_name(arg)                                                                                          
#      end 
    
#    def self.method_name (args)
#      define_method "#{method_name}" do |arguments|
#            @objeto.method_name(arguments)
#    end
       
    
  end

    
    
end