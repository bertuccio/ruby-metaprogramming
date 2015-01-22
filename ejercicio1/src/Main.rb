require 'Asignatura'
require 'Tema'



asignatura = Asignatura.new('ASD',123,'ojete@oejte.com')
tema = Tema.new('tuputamadre')
asignatura.addTema(tema)
puts asignatura
puts tema