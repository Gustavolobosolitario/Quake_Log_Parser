 module ParseLog

	#regra para identificar o inicio do jogo
	def self.inicio_jogo_regra
    	/InitGame/
  	end

  	#regra para identificar o fim do jogo
  	def self.fim_jogo_regra
    	/--------+/
  	end

end