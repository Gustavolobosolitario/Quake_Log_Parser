require_relative 'quake_log_parser'
require_relative 'modelos/jogo'

class Main

	#exibindo Jogos
	@games = QuakeLogParser.parse_jogos('games_teste.log');
	@ranking_geral = Jogo.ranking_geral(@games)
	@ranking_game = Jogo.ranking_game(@games)

	puts "---------- TASK 1 ----------"
	puts @games
	puts "---------- FIM TASK 1 ----------"
	puts "---------- TASK 2 ----------"
	puts "RANKING:"
  puts @ranking_geral
  i = 0
  @ranking_game.each do |game|
    puts "Game #{i+=1}"
    puts game
    puts "\n"
  end

  puts "---------- TASK 3 ----------"
  puts "RANKING DE CAUSAS DE MORTE"
  @games.each do |game|

     puts " #{game.game}: {"
     puts "   Causas de mortes: {"
      game.causa_morte.each do |causa|
        puts "     '#{causa.first}' : #{causa.last}"
      end
      puts "   }"
      puts "}\n\n"
  end


end
