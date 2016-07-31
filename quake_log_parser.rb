class QuakeLogParser
	
	#Método para ler arquivo e retorna-lo em um array
	def self.ler_arquivo (arquivo = 'games.log') #Definindo arquivo de log padrão.
      linhas_array = []
      arquivo = File.open(arquivo, 'r')
      #Atribuindo linhas do arquivo no array
      arquivo.each_line {|linha| linhas_array << linha}

	  linhas_array
	end

end