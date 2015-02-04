class TablaFiltrable
  
  def initialize(nombreColumnas)
    @mapa = Hash.new()
    nombreColumnas.each{|c|
      @mapa.store(c,nil)
    }
    puts @mapa.keys

  end
  
  def addFila(element)
    @mapa = element
    puts @mapa.keys
  end
  
  def delFila
  end
  
end