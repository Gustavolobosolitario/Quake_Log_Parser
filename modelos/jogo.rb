require_relative '../modulo/parse_log'
class Jogo

	attr_accessor :game, :total_kills, :players

	def initialize(linhas_log_array, game)

		@game = game
		@total_kills = 0
		@players = []

		linhas_log_array.each do |linha_log|
			#verifica se na possui informações sobre o jogador 
			if ParseLog.jogador_linha?(linha_log)
				#atribui a variavel jogador_nome o nome do jogador.
				jogador_nome = linha_log[ParseLog.jogador_info_regra][ParseLog.jogador_nome_regra]
				#se a não possui o nome do jogador no array,(players), adiciona o novo jogador
				@players << jogador_nome unless @players.include? jogador_nome
			elsif ParseLog.morte_linha?(linha_log)
				@total_kills += 1
			end
		
		end
	end

	def to_s
		"#{self.game} : { \n   total_kills: #{self.total_kills}, \n   players: #{self.players}\n  }"
	end

end