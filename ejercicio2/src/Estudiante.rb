class Estudiante
  
  @@ids = 0
  
  atrr :nombre
  
  def initialize(nombre, nif, email)
    @id = @@ids
    @@ids += 1
    @nombre = nombre
    @nif = nif
    @email = email 
  end
  
  def == (other)
      @nombre == other.nombre 
  end
  
end