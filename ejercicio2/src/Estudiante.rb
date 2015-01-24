class Estudiante
  
  @@ids = 0
  
  attr_reader :nif
  
  def initialize(nombre, nif, email)
    @id = @@ids
    @@ids += 1
    @nombre = nombre
    @nif = nif
    @email = email 
  end
  
  def == (other)
      @nif == other.nif 
  end
  
  def to_s
    return "Nombre: " + @nombre.to_s + " NIF: " + @nif.to_s
  end
  
end