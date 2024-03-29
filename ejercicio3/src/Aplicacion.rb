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
  
  def eliminaGrupo(asignatura, grupo)
    if @asignaturas.include?(asignatura)
      index = @asignaturas.index(asignatura)
      @asignaturas.fetch(index).eliminaGrupo(grupo)
    end
  end
  
  def matricula(estudiante,asignatura)
    if ((not @estudiantes.include?(estudiante)) || 
      (not @asignaturas.include?(asignatura)))
      raise ExcepcionEstudianteAlta.new(estudiante), 
        "Estudiante no dado de alta: ", caller
    else
      grupos = asignatura.grupos.sort_by{|g1| 
        g1.getNumAlumnos}
      grupos.each{|g| 
        if g.estudiantes.include?(estudiante)
          raise ExcepcionMatriculacion.new(estudiante, asignatura), 
                  "Estudiante ya matriculado: ", caller
        end
      }
      grupos.first.addEstudiante(estudiante) 
    end
  end 
  
  def login(estudiante)
    if @estudiantes.include?(estudiante)
      mainMenu(estudiante)
    end
  end
  

  
  def mainMenu(estudiante)
    
    printf "##############\n"
    printf "# Menu:      #\n"
    printf "##############\n"
    
    asignaturas = Array.new
    @asignaturas.each{|a|
      a.grupos.each{|g|
        if g.estudiantes.include?(estudiante)
          asignaturas.push(a)
        end
      }
    }
    begin
      asignaturas.each{|a|
        printf(asignaturas.index(a).to_s+") "+a.to_s+"\n")}
      printf(asignaturas.length().to_s+") " + "salir"+"\n")
      printf "Introduce eleccion: "
      eleccion = gets
      if eleccion.to_i == asignaturas.length()
        break
      elsif eleccion.to_i < asignaturas.length() and
        eleccion.to_i >= 0
          asignaturas.fetch(eleccion.to_i).menu
      end
    end while true
  end
end

