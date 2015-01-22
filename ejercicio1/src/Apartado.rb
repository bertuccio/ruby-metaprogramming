class Apartado
  def initialize(enunciado, puntuacion)
    if(puntuacion <= 0)
      raise ArgumentError,
        "Puntuación #{puntuacion} incorrecta, debe ser mayor que 0",
        caller
    end
    @enunciado = enunciado
    @puntuacion = puntuacion
  end
  
  attr_reader :enunciado
  attr_reader :puntuacion
  
end

#Test 

begin
a = Apartado.new('enunciado1',0)
rescue ArgumentError
  puts $!
ensure
  a = Apartado.new('enunciado1',1)
  puts a.enunciado
  puts a.puntuacion
end