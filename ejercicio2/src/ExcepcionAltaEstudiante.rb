class ExcepcionEstudianteAlta < RuntimeError
  
  def initialize(estudiante)
    @estudiante = estudiante
  end
  
  attr_reader :estudiante

end

