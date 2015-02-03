require 'Complejo'
require 'PruebasUnitarias'

class PruebaComplejo < PruebasUnitarias::Prueba
  
  def inicializacion
    @c1 = Complejo.new(3,5)
    @c2 = Complejo.new(1,-1)
  end
  
  def prueba_suma
    @c1.sumar(@c2)
    assertIgual(@c1.real, 4)
    assertIgual(@c1.imaginario, 4)
  end
  
  def prueba_suma_cero
    @c2.sumar(Complejo.new(0,0))
    assertCierto(@c2.real==1)
    assertCierto(@c2.imaginario==-1)  
  end
  
  def prueba_suma_nula
    @c2.sumar(nil)
    assertIgual(@c2.real, 1)
    assertIgual(@c2.imaginario, -1)
  end
  
  def imprimir (complejo)
    puts "complejo : #{complejo.real}, #{complejo.imaginario}i"
  end
  
end