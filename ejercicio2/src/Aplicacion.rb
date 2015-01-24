require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'
require 'Apartado'
require 'Ejercicio'
require 'Estudiante'
require 'ExcepcionAltaEstudiante'
require 'Grupo'

class Aplicacion
  
  def initialize
    @estudiantes = Array.new
    @asignaturas = Array.new
  end
  
  def altaEstudiante(estu)
    unless @estudiantes.include?(estu)
      @estudiantes.push(estu) 
    end
  end
 
  def addAsignatura(asig)
    unless @asignaturas.include?(asig)
      @asignaturas.push(asig)
    end
  end
  
  def matricula(estudiante,asignatura)
    unless @estudiantes.include?(estudiante) or
      @asignaturas.include?(asignatura)
      raise ExcepcionEstudianteAlta.new(estudiante), 
        "Estudiante no dado de alta: ", caller
    else
      grupos = asignatura.grupos.sort_by{|g1| 
        g1.getNumAlumnos}
      grupos.each{|g| 
        if g.estudiantes.include?(estudiante)
          raise ExcepcionEstudianteAlta.new(estudiante, asignatura), 
                  "Estudiante ya matriculado: ", caller
        end
      }
      grupos.first.addEstudiante(estudiante) 
    end
  end 
end

begin
  apartado = Apartado.new('enunciado1',2)
  e = Ejercicio.new('ejercio1',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3)
  
  g1 = Grupo.new('123','profesor')
  g2 = Grupo.new('1234','profesor')
  g3 = Grupo.new('12345','profesor')
  asignatura = Asignatura.new(123,'nombre',g1) 
  asignatura.addGrupo(g2)
  asignatura.addGrupo(g3)
  tema = Tema.new('tema1')
  
  tema2 = Tema.new('tema2')
  apuntes3 = Apuntes.new('apunt1','texto',Date.new(2009,1,5),10)
  apuntes1 = Apuntes.new('apunt3','texto',Date.new(2011,7,5),3)
  apuntes2 = Apuntes.new('apunt2','texto',Date.new(2008,3,5),1)
  tema.addElemento(apuntes2)
  tema.addElemento(apuntes1)
  tema2.addElemento(apuntes3)
  tema.addElemento(Ejercicio.new('ejercio2',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3))
  asignatura.addElemento(tema)
  tema.addElemento(tema2)
  tema3 = Tema.new('tema3')
  tema3.addElemento(Apuntes.new('apunt4','texto',Date.new(2008,3,5),6))
  asignatura.addElemento(tema3)
  asignatura.addElemento(tema2)
  
  apuntes4 = Apuntes.new('apunt5','texto',Date.new(2004,1,5),2)
  asignatura.addElemento(apuntes4)
  asignatura.addElemento(e)
  asignatura.fechaComienzo
  asignatura.numHorasDedicacion
  
  e1 = Estudiante.new('anonimo',123,'anonimo@anonimo.com')
  e2 = Estudiante.new('anonima',12345,'anonimo@anonimo.com') 
  e3 = Estudiante.new('anonima',1234,'anonimo@anonimo.com') 
  e4 = Estudiante.new('anonima',12346,'anonimo@anonimo.com') 
   
  app = Aplicacion.new
  
begin
    app.addAsignatura(asignatura)
    app.altaEstudiante(e1)
    app.altaEstudiante(e2)
    app.matricula(e1,asignatura)
    puts asignatura
    app.matricula(e2,asignatura)
    app.matricula(e3,asignatura)
    app.matricula(e4,asignatura)
    puts asignatura
  rescue ExcepcionEstudianteAlta => error
    print error, error.estudiante, " ", error.asignatura, "\n"
  end
end