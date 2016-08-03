require_relative 'quake_log_parser'
require_relative 'modelos/jogo'

class Main

	#exibindo Jogos
	@games = QuakeLogParser.parse_jogos('games_teste.log');
	@rank = Jogo.rank(@games)
	
	puts "---------- TASK 1 ----------"
	puts @games
	puts "---------- FIM TASK 1 ----------"
	puts "---------- TASK 2 ----------"
	puts "RANKING:"
	puts @rank

end
