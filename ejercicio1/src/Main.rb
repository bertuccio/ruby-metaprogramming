require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'


asignatura = Asignatura.new('asignatura',123,'hola@hola.com')
tema = Tema.new('tema1')
asignatura.addElemento(tema)
tema2 = Tema.new('tema2')
apuntes3 = Apuntes.new('apunt3','texto',Date.new(2012,1,5),10)
apuntes1 = Apuntes.new('apunt1','texto',Date.new(2015,7,5),3)
apuntes2 = Apuntes.new('apunt2','texto',Date.new(2016,3,5),1)
tema.addElemento(apuntes2)
tema.addElemento(apuntes1)
tema2.addElemento(apuntes3)
asignatura.addElemento(tema2)
puts asignatura.fechaComienzo.to_s
puts asignatura.numHorasDedicacion.to_s
puts asignatura

