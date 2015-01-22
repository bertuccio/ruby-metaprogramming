require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'


asignatura = Asignatura.new('ASD',123,'ojete@oejte.com')
tema = Tema.new('tuputamadre')
asignatura.addElemento(tema)
tema2 = Tema.new('z')
apuntes3 = Apuntes.new('desc4','texto',Date.new(2012,1,5),10)
apuntes1 = Apuntes.new('desc','texto',Date.new(2015,7,5),3)
apuntes2 = Apuntes.new('desc2','texto',Date.new(2016,3,5),1)
tema.addElemento(apuntes2)
tema.addElemento(apuntes1)
tema2.addElemento(apuntes3)
asignatura.addElemento(tema2)
puts asignatura.fechaComienzo
puts asignatura.numHorasDedicacion.to_s
puts asignatura

