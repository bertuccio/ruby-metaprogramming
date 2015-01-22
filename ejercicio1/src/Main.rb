require 'Asignatura'
require 'Tema'
require 'date'
require 'Apuntes'


asignatura = Asignatura.new('ASD',123,'ojete@oejte.com')
tema = Tema.new('tuputamadre')
asignatura.addElemento(tema)


apuntes1 = Apuntes.new('desc','texto',Date.new(2015,2,5))
apuntes2 = Apuntes.new('desc','texto',Date.new(2012,2,5))
tema.addElemento(apuntes1)
tema.addElemento(apuntes2)
puts asignatura.fechaComienzo()
puts asignatura

