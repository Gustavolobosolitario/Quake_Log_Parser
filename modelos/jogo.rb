require 'json'
require_relative '../modulo/parse_log'
require_relative 'jogador'
require_relative 'morte'
class Jogo

	attr_accessor :game, :total_kills, :players, :kills

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

			elsif ParseLog.morte_linha?(linha_log)
				linha_morte = linha_log[ParseLog.kill_regra]
				morte = Morte.new linha_morte[ParseLog.matou_regra], linha_morte[ParseLog.morreu_regra],linha_morte[ParseLog.causa_morte]
				@kills << morte

				att_mortes(morte)
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

	def att_mortes(morte)
		if morte.matou == "<world>" #or morte.matou == morte.morreu (Caso for considerar suicidio)
			@players[morte.morreu].kills -= 1
		else
			@players[morte.matou].kills +=1
		end
	end

	def self.ranking_geral(games)
		rank_geral = []
		jogador_hash = {}
		games.each do |game|
			game.players.each do |jogador_nome, jogador|
				if jogador_hash[jogador_nome].nil?
					jogador_hash[jogador_nome] = (Jogador.new jogador.nome, jogador.kills)
				else
					jogador_inserido = jogador_hash[jogador_nome]
					jogador_inserido.kills += jogador.kills
				end
			end
		end
		#Array de jogadores ordenados pelo numero de kills
		jogador_array_ord = jogador_hash.sort_by{|p, q| q.kills}.reverse
		jogador_array_ord.map {|p,q|q}.each do |jogador|
			rank_geral << "PLAYER #{jogador.nome} #{jogador.kills} KILLS"
		end
		rank_geral
	end

	def self.ranking_game(games)
		rank_game = []

		games.each do |game|
			texto_rank = []
			jogadores = game.players.map{|p, q|q}.sort_by {|p|p.kills}.reverse

			jogadores.each do |jogador|
				texto_rank << "PLAYER #{jogador.nome} #{jogador.kills} KILLS"
			end
			rank_game << 	texto_rank
		end
		rank_game
		end

		def causa_morte
			causa_morte_hash = {}
			self.kills.each do |morte|
				causa_morte_hash[morte.causa_morte] = causa_morte_hash[morte.causa_morte].to_i + 1
			end
			causa_morte_hash.sort_by{ |p,q| q	}.reverse!
		end
end
