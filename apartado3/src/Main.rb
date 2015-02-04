require 'TablaFiltrable'

class Main
  
  # creamos una tabla filtrable
  notas = TablaFiltrable.new(["NOMBRE", "PRACTICAS", "EXAMEN", "GRUPO"])
  notas.addFila( {"NOMBRE"=>"Sonia Alba", "PRACTICAS"=>5, "EXAMEN"=>7, "GRUPO"=>221} )
#  notas.addFila( {"NOMBRE"=>"Marta Sanz", "PRACTICAS"=>9, "EXAMEN"=>7, "GRUPO"=>212} )
#  notas.addFila( {"NOMBRE"=>"Pedro Saiz", "PRACTICAS"=>4, "EXAMEN"=>2, "GRUPO"=>212} )
#  notas.addFila( {"NOMBRE"=>"Lucas Ruiz", "PRACTICAS"=>8, "EXAMEN"=>"NP", "GRUPO"=>212} )
#  # definimos filtros sobre las columnas de la tabla
#  notas.addFiltro("SuperaExamen", "EXAMEN") {|nota| nota!="NP" and nota>=5 }
#  notas.addFiltro("SuperaPracticas", "PRACTICAS") {|nota| nota!="NP" and nota>=5 }
#  notas.addFiltro("AlumnosGrupo212", "GRUPO") {|grupo| grupo==212}
#  # aplicamos todos los filtros: alumnos del grupo 212 que superan la asignatura (Sonia y Marta)
#  superanAsignatura212 = notas.filtrar
#  # aplicamos filtros por nombre: alumnos que superan la asignatura (Marta)
#  superanAsignatura = notas.filtrar(["SuperaExamen","SuperaPracticas"])
#  # aplicamos filtros sobre columna: alumnos que superan las prácticas (Sonia, Marta y Lucas)
#  superanPracticas = notas.filtrarPorColumna("PRACTICAS")
  
end