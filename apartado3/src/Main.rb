require 'TablaFiltrable'

class Main
  begin
    # creamos una tabla filtrable
    notas = TablaFiltrable.new(["NOMBRE", "PRACTICAS", "EXAMEN", "GRUPO"])
    notas.addFila( {"NOMBRE"=>"Sonia Alba", "PRACTICAS"=>5, "EXAMEN"=>5, "GRUPO"=>221} )
    notas.addFila( {"NOMBRE"=>"Marta Sanz", "PRACTICAS"=>9, "EXAMEN"=>7, "GRUPO"=>212} )
    notas.addFila( {"NOMBRE"=>"Pedro Saiz", "PRACTICAS"=>5, "EXAMEN"=>4, "GRUPO"=>212} )
    notas.addFila( {"NOMBRE"=>"Lucas Ruiz", "PRACTICAS"=>4, "EXAMEN"=>"NP", "GRUPO"=>212} )
    # definimos filtros sobre las columnas de la tabla
    notas.addFiltro("SuperaExamen", "EXAMEN") {|nota| nota!="NP" and nota>=5 }
    notas.addFiltro("SuperaPracticas", "PRACTICAS") {|nota| nota!="NP" and nota>=5 }
    notas.addFiltro("AlumnosGrupo212", "GRUPO") {|grupo| grupo==212}
    # aplicamos todos los filtros: alumnos del grupo 212 que superan la asignatura (Sonia y Marta)
    notas.getFiltro("AlumnosGrupo212").desactivar
    notas.getFiltro("AlumnosGrupo212").activar
    superanAsignatura212 = notas.filtrar
    puts superanAsignatura212
    # aplicamos filtros por nombre: alumnos que superan la asignatura (Marta)
    superanAsignatura = notas.filtrar(["SuperaExamen","SuperaPracticas"])
    puts superanAsignatura
    # aplicamos filtros sobre columna: alumnos que superan las prácticas (Sonia, Marta y Lucas)
    superanPracticas = notas.filtrarPorColumna("EXAMEN")
    puts superanPracticas
    puts "\n",notas
  rescue Exception
    puts $!
  end

end