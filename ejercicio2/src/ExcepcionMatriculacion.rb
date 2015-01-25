class ExcepcionMatriculacion < ExcepcionEstudianteAlta
  def initialize(estudiante, asignatura)
    super(estudiante)
    @asignatura = asignatura
  end
  
  attr_reader :asignatura
  
end