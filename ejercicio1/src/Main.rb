require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'
require 'Apartado'
require 'Ejercicio'

apartado = Apartado.new('enunciado1',2)
e = Ejercicio.new('ejercio1',Date.new(2015,1,5),Date.new(2015,1,7),apartado,3)

asignatura = Asignatura.new(123,'nombre')
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
puts asignatura

