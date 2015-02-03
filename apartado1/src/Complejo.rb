class Complejo
  
  def initialize (real, imaginario)
    @real = real
    @imaginario = imaginario
  end
  
  def sumar (complejo)
    @real = @real + complejo.real
    @imaginario = @imaginario + complejo.imaginario
  end
  
  attr_reader :real, :imaginario
end