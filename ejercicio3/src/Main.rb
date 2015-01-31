require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'
require 'Apartado'
require 'Ejercicio'
require 'Estudiante'
require 'ExcepcionAltaEstudiante'
require 'ExcepcionMatriculacion'
require 'Grupo'
require 'fileutils.rb'
require 'Aplicacion'

#apartado = Apartado.new('enunciado1',2)
#e = Ejercicio.new('ejercio1',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3)
#
#asignatura = Asignatura.new(123,'nombre')
#tema = Tema.new('tema1')
#
#tema2 = Tema.new('tema2')
#apuntes3 = Apuntes.new('apunt1','texto',Date.new(2009,1,5),10)
#apuntes1 = Apuntes.new('apunt3','texto',Date.new(2011,7,5),3)
#apuntes2 = Apuntes.new('apunt2','texto',Date.new(2008,3,5),1)
#tema.addElemento(apuntes2)
#tema.addElemento(apuntes1)
#tema2.addElemento(apuntes3)
#tema.addElemento(Ejercicio.new('ejercio2',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3))
#asignatura.addElemento(tema)
#tema.addElemento(tema2)
#tema3 = Tema.new('tema3')
#tema3.addElemento(Apuntes.new('apunt4','texto',Date.new(2008,3,5),6))
#asignatura.addElemento(tema3)
#asignatura.addElemento(tema2)
#
#apuntes4 = Apuntes.new('apunt5','texto',Date.new(2004,1,5),2)
#asignatura.addElemento(apuntes4)
#asignatura.addElemento(e)
#asignatura.fechaComienzo
#asignatura.numHorasDedicacion
#puts asignatura



begin
  apartado = Apartado.new('enunciado1',2)
  apartado2 = Apartado.new('enunciado2',4)
  e = Ejercicio.new('ejercio1',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3)
  e.addApartado(apartado2)
  
  
  
  e.descarga
  
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
  
  apuntes3.descarga
  
  tema.addElemento(apuntes2)
  tema.addElemento(apuntes1)
  tema2.addElemento(apuntes3)
  tema.addElemento(Ejercicio.new('ejercio2',Date.new(2015,1,5),Date.new(2015,12,7),apartado,3))
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
  #app.entrega
  
  app.addAsignatura(asignatura)
  app.altaEstudiante(e1)
  app.altaEstudiante(e2)
  app.altaEstudiante(e3)
  app.altaEstudiante(e4)
  app.matricula(e1,asignatura)
  #puts asignatura
  app.matricula(e2,asignatura)
  app.matricula(e3,asignatura)
  app.matricula(e4,asignatura)
  app.eliminaGrupo(asignatura,g1)
  puts asignatura
  app.login(e1)
rescue ExcepcionEstudianteAlta => error
  print error, error.estudiante, "\n"
rescue ExcepcionMatriculacion => error
  print error, error.estudiante, " ", error.asignatura, "\n"

end