require_relative 'modelos/jogo'
require_relative 'modulo/parse_log'
class QuakeLogParser
	
	#Método para ler arquivo e retorna-lo em um array
	def self.ler_arquivo (arquivo = 'games.log') #Definindo arquivo de log padrão.
      linhas_array = []
      arquivo = File.open(arquivo, 'r')
      #Atribuindo linhas do arquivo no array
      arquivo.each_line {|linha| linhas_array << linha}

	  linhas_array
	end

	#Método para realizar o parse em cada linha do arquivo
	#e separar bloco de linhas referente a um jogo
	def self.parse_jogos(arquivo = 'games.log')
		linhas_log = QuakeLogParser.ler_arquivo(arquivo)		
		
		jogos = []
		inicio_jogo_linha = nil

		linhas_log.each_with_index do |linha_log, index|

			#verificando se é o inicio do jogo ("InitGame")	
			if ParseLog.inicio_jogo_linha?(linha_log)
				inicio_jogo_linha = index
			
			#verificando se é o final do jogo ("------+")
			elsif ParseLog.fim_jogo_linha?(linha_log)
				fim_jogo_linha = index - inicio_jogo_linha.to_i + 1
				#Caso tenha sido encontrado a linha do inicio do jogo, ele adiciona
				jogos << (Jogo.new linhas_log[inicio_jogo_linha, fim_jogo_linha] ,"game_#{jogos.count+1}") unless inicio_jogo_linha.nil?
				#puts log_lines[1,8]
				inicio_jogo_linha = nil
			end
		end
		jogos
	end
end