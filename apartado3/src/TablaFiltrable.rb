require 'exceptions/ExcepcionColumnaIncorrecta'
require 'exceptions/ExcepcionFilaIncorrecta'
require 'Filtro'

class TablaFiltrable
  
  def initialize(nombreColumnas)
    
    if not nombreColumnas.nil?
      @filtros = Array.new
      @numFilas = 0
      @tabla = Hash.new
      nombreColumnas.each{|c|
        @tabla.store(c,Array.new)
      }
    end
  end

  attr_reader :numFilas
  
  def addFila(element)
    
    if not element.nil?
      
      if not element.size == @tabla.keys.size
        raise ExcepcionFilaIncorrecta.new(element)
      end
      
      element.each{|e|
        if not @tabla.has_key?(e[0])
          raise ExcepcionColumnaIncorrecta.new(e[0])
        else
          @tabla.fetch(e[0]).push(e[1])
        end
      }
      @numFilas += 1
    end
  end
  

  def delFila(indice)
    if not (indice.nil? or indice.to_i >= @numFilas)
      @tabla.keys.each{|k|
        @tabla.fetch(k).delete_at(indice)
      }
      @numFilas -= 1
    else
      raise IndexError, "índice erróneo #{indice} al borrar fila", caller
    end
  end
  
  def addFiltro(nombre, columna, &bloque)
  
    if not (nombre.nil? or columna.nil? or bloque.nil?)
      if not @tabla.keys.include?(columna)
        raise IndexError, "Error al añadir filtro el #{nombre} "+
        ", columna #{columna} errónea", caller
      end
      
      filtro = Filtro.new(nombre,columna,bloque)
      if not @filtros.include?(filtro)
        @filtros.push(filtro)
      end
    end
  end
  
  def delFiltro(nombre)

    if not nombre.nil?
      @filtros.delete(getFiltro(nombre))
    end
  end

  
  def activaFiltro(nombre)

    if not nombre.nil?
      getFiltro(nombre).activar
    end
  end

  def desactivaFiltro(nombre)

    if not nombre.nil?
      getFiltro(nombre).desactivar
    end
  end
  
  def getFiltro(nombre)
    if not nombre.nil?
      @filtros.each{|f|
        if f.nombre == nombre
          return f
        end
      }
    end
    return nil
  end
  
  
  def filtrar(*args)

    hashFiltrada = copyhash(@tabla)
    indices = Array.new
    
    if args.size == 0
      filtros = @filtros
    else
      filtros = Array.new
      args[0].each{|arg|
        filtro  = getFiltro(arg)
        if not filtro.nil?
          filtros.push(filtro)
        end
      }
    end
    
    filtros.each{|filtro|
      
      if filtro.activado
        index = 0
        hashFiltrada.fetch(filtro.columna).each{|value|
          if not filtro.bloque.call(value)
            indices.push(index)
          end
          index += 1
        }
        indices = indices.sort{|a,b| b <=> a}
        hashFiltrada.keys.each{|key|
          indices.each{|indice|
            hashFiltrada.fetch(key).delete_at(indice)
          }
        }
        indices.clear
        
      end
    }
    return hashFiltrada
  end
  
  
  def filtrarPorColumna(columna)

    if not columna.nil? and @tabla.keys.include?(columna)
      @tabla.freeze

      hashFiltrada = copyhash(@tabla)
      indices = Array.new

      @filtros.each{|filtro|
        if filtro.columna == columna and filtro.activado
          index = 0
          hashFiltrada.fetch(columna).each{|value|
            
            if not filtro.bloque.call(value)
              indices.push(index)
            end
            index += 1
          }
          indices = indices.sort{|a,b| b <=> a}
          
          indices.each{|indice|
            hashFiltrada.keys.each{|key|
              hashFiltrada.fetch(key).delete_at(indice)
            }
          }
          
          indices.clear
        end
      }
      return hashFiltrada
    end
  end

  def to_s
    s = ""
    @tabla.keys.each{|k| s += (k.to_s + "\t")}
    s += "\n\n"

    i = 0
    while i < @numFilas
      @tabla.keys.each{|k|
        s += (@tabla.fetch(k)[i].to_s + "\t")
      }
      s += "\n"
      i += 1
    end

    return s
  end
  
  private

  def copyhash(inputhash)
    h = Hash.new
    inputhash.each do |pair|
      h.store(pair[0].dup, pair[1].dup)
    end
    return h
  end

  
end