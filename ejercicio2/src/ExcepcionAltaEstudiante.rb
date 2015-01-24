class ExcepcionEstudianteAlta < RuntimeError
  
  def initialize(*args)
    @estudiante, @asignatura = *args
  end
  
##  attr_reader :asignatura
  def asignatura
    unless @asignatura.nil?
      return @asignatura.nombre
    end
    return ''
  end
  
  def estudiante
    unless @estudiante.nil?
      return @estudiante.nombre
    end
    return ''
  end
end

