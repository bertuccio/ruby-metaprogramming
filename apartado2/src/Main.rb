require 'ProxyConcurrencia'

class Main
  
  begin

    proxy = ProxyConcurrencia.new([1, 2, 3])
    proxy.bloqueaRecurso('a')
    puts proxy.index('a',1) 
    puts proxy.index('a',1) 
    puts proxy.index('a',2) 
    puts proxy.length('a') 
    puts proxy.length('a') 
  rescue Exception
    puts $!
  end

  
end