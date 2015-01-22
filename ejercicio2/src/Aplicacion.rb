class Aplicacion
  
  def initialize
    @estudiantes = Array.new
    @asignaturas = Array.new
  end
  
  def addEstudiante(estu)
    @estudiantes.push(estu)
  end
 
  def addAsignatura(asig)
    @asignaturas.push(asig)
  end 
  
  
end