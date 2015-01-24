class Grupo
  
  def initialize(codigo, profesor, estudiantes)
    @codigo = codigo
    @profesor = profesor
    @estudiantes = estudiantes
  end
  
  attr_reader :codigo
  
  def == (other)
      @codigo == other.codigo 
  end
  
end