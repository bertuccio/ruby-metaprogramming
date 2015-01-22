class Tema
def initialize(descripcion)
  @descripcion = descripcion
  @elementos = nil
end

  def to_s
    'Tema: ' + @descripcion 
  end

end