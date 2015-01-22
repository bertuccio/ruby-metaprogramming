class Asignatura
  
  def initialize(nombre,nif,email)
    # Instance variables
    @nombre = nombre
    @nif = nif
    @email = email 
    @tema = nil
  end
  
  def to_s
    s = '+Asignatura: ' + @nombre.to_s + ', ' + @nif.to_s + ', ' + @email.to_s 
    unless @tema.nil?
      s += "\n\t-" + @tema.to_s
    end
    return s
  end
  
  def addTema(tema)
    if @tema.nil?
      @tema = Array.new
    end
    @tema.push(tema)
  end
  
end

