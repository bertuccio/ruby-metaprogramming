class ExcepcionEstudianteAlta < RuntimeError
  
  def initialize(*args)
    @estudiante, @asignatura = *args
  end
  attr_reader :estudiante 
##  attr_reader :asignatura
  def asignatura
    unless @asignatura.nil?
      return @asignatura
    end
    return ''
  end
end


begin
  e = ExcepcionEstudianteAlta.new('est','asig')
  print e.estudiante + e.asignatura
  e = ExcepcionEstudianteAlta.new('estu')
  print e.estudiante + e.asignatura
end