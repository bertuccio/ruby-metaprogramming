module PruebasUnitarias

  class Prueba
    
    
    def assertIgual(eval1, eval2)
      if(eval1 == eval2)
        @numAciertos += 1
      end
      @numAsserts += 1
    end
    
    def assertCierto(eval)
      if eval
        @numAciertos += 1
      end
      @numAsserts += 1
    end
    
    def assertFalso(eval)
      if (not eval)
        @numAciertos += 1
      end
        @numAsserts += 1
    end
    
    def assertDistinto(eval1, eval2)
      if (eval1 != eval2)
        @numAciertos += 1
      end
        @numAsserts += 1
    end
    
    def assertNil(eval)
      if eval.nil?
        @numAciertos += 1
      end
        @numAsserts += 1
    end
    
    def assertContiene(contenedor, e)
      if contenedor.include?(e)
        @numAciertos += 1
      end
        @numAsserts += 1
    end
    
    def actualizacion
      @numAciertos = 0
      @numAsserts = 0
    end
    
    def to_s
      s = "cumple el " + (@numAciertos.fdiv(@numAsserts)*100).to_i.to_s + 
        "% de las aserciones, falla " +
        ((@numAsserts - @numAciertos).fdiv(@numAsserts)*100).to_i.to_s +
        "% de las aserciones"
      return s; 
    end
    
    def run
      if self.respond_to? :inicializacion
        self.inicializacion
        methods = self.methods.grep(/(prueba.*)/).sort
        methods.each{|m|
          if self.respond_to? :actualizacion
            self.actualizacion
          end
          print m.to_s," => " 
          begin
            method(m).call
          rescue Exception
            print "hubo excepcion inesperada ",$!,"\n"
          else
            puts self
          end
        }
      end
    end

  end
end