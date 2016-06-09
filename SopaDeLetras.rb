## Jueves 9 de Junio del 2016
## Sopa de Letras
## HSP y MRM

=begin
  
    0 1 2 3 4 5 6 7 8 9 10 
  0 ---------------------   X EN TODOS LOS PARES DESDE EL 0 HASTA 
  1 | X | X | X | X | X |   EL 16 HAY 21 GUIONES
  2 ---------------------   Y EN TODOS LOS PARES DESDE EL 0 HASTA 
  3 | X | X | X | X | X |   EL 10 HAY UN POLE
  4 ---------------------
  5 | X | X | X | X | X |
  6 ---------------------
  7 | X | X | X | X | X |
  8 ---------------------
  9 | X | X | X | X | X |
 10 ---------------------
 11 | X | X | X | X | X |
 12 ---------------------
 13 | X | X | X | X | X |
 14 ---------------------
 15 | X | X | X | X | X |
 16 ---------------------



=end

# rescue Exception => e
  
# end



class Board
# You should put here the given boards templates
@@boards_templates =  "POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"

  def initialize
   complete_board!
  end

  def to_s
    @@boards_templates.split("")
    i = 0
    for fila in 0..16
      for columna in 0..10
        if fila % 2 == 0 
          print "--"
        elsif columna % 2 == 0 && fila % 2 != 0
          print "|"
        else
          print " " + @@boards_templates[i] + " "
          i += 1
        end
      end 
      puts
    end    
  end

  def include?(word) 
    array_matrix = []
    @@boards_templates.split("").each_slice(5) {|v| array_matrix << v}
    #Comparación horizontal
    a = array_matrix.transpose.join
    return true if @@boards_templates.include?(word) 
    #Comparación horizontal en reversa
    return true if @@boards_templates.reverse.include?(word)
    #Comparación vertical
    return true if a.include?(word)
    #Comparación vertical en reversa
    return true if a.reverse.include?(word)
    #Comparación en diagonal
    #Hacer un arreglo que contenga en orden los arrgelos en en diagonal, 
    # o sea (hacia al lado IZQUIEDA) [P], [OH], [ECH], etc.
  end

  private 
 
  def complete_board!
  cont = 0
    loop do 
     @@boards_templates.sub!("X", ("A".."Z").to_a.sample)
     cont += 1
     break if cont == @@boards_templates.length
     end 
  @@boards_templates
  end
end

 



board = Board.new
puts board
board.include?("POEMA")


