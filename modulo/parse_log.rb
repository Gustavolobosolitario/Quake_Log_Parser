 module ParseLog

	#regra para identificar o inicio de jogo
	def self.inicio_jogo_regra
    	/InitGame/
  	end

  	#regra para identificar o fim de jogo
  	def self.fim_jogo_regra
    	/--------+/
  	end

  	#metodos para usar as regras
	def self.inicio_jogo_linha?(linha_log)
    	linha_log =~ ParseLog.inicio_jogo_regra
  	end
  
	def self.fim_jogo_linha?(linha_log)
		linha_log =~ ParseLog.fim_jogo_regra
	end
end