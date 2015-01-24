class Grupo
  
  include Comparable
  
  def initialize(codigo, profesor)
    @codigo = codigo
    @profesor = profesor
    @estudiantes = Array.new
  end

  attr_reader :codigo
  attr_reader :estudiantes

  def addEstudiante(estudiante)
    unless @estudiantes.include?(estudiante)
      @estudiantes.push(estudiante) 
    end
  end
  
  def getNumAlumnos
    return @estudiantes.length()
  end
    
  def to_s
    return "Grupo: " + @codigo.to_s + " Profesor: " + @profesor +
      " Num Estudiantes: " + @estudiantes.length.to_s
  end
  
#  def (a2)
#  end
    
  def == (other)
      @codigo == other.codigo 
  end
  
end