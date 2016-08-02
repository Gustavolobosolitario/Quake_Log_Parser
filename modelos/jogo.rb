require_relative '../modulo/parse_log'
class Jogo

	attr_accessor :game, :total_kills

	def initialize(linhas_log_array, game)

		@game = game
		@total_kills = 0

		linhas_log_array.each do |linha_log|
			if ParseLog.morte_linha?(linha_log)
				@total_kills += 1
			end
		
		end
	end

	def to_s
		"#{self.game} : { total_kills: #{self.total_kills}}"
	end

end