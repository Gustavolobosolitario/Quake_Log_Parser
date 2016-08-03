require 'json'
require_relative '../modulo/parse_log'
require_relative 'jogador'
require_relative 'morte'
class Jogo

	attr_accessor :game, :total_kills, :players, :kills, :teste

	def initialize(linhas_log_array, game)

		@game = game
	#   @total_kills = 0
		@players = {}
		@kills = []

		linhas_log_array.each do |linha_log|
			#verifica se na possui informações sobre o jogador
			if ParseLog.jogador_linha?(linha_log)
				#atribui a variavel jogador_nome o nome do jogador.
				jogador_nome = linha_log[ParseLog.jogador_info_regra][ParseLog.jogador_nome_regra]
				#se a não possui o nome do jogador no array,(players), adiciona o novo jogador
				@players[jogador_nome] = (Jogador.new jogador_nome) unless @players[jogador_nome]
				#puts @players.map {|jogador| jogador[1]}
				
				
			elsif ParseLog.morte_linha?(linha_log)
				linha_morte = linha_log[ParseLog.kill_regra]
				morte = Morte.new linha_morte[ParseLog.matou_regra]
				@kills << morte 
			end
		end

	end

	def to_s
		"#{self.game} : { \n  total_kills: #{self.total_kills}, \n  players: #{self.jogador_nome}\n  kills:{#{JSON.pretty_generate(self.jogadores_array)}}"
	end

	#retorna o total de kills
	def total_kills
		self.kills.count
	end

	#retorna o nome do jogador
	def jogador_nome
		self.jogadores_array.map {|jogador| jogador.nome}
	end

	def jogadores_array
		jogador = self.players
		#retorna o jogador com o nome e com o numero de kills
		jogador.map {|jogador_array| jogador_array[1]}
	end
end