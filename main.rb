require_relative 'quake_log_parser'

class Main

	#exibindo Jogos
	@games = QuakeLogParser.parse_jogos('games_teste.log');
	puts @games
end