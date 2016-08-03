module ParseLog

  #regra para identificar o inicio de jogo
  def self.inicio_jogo_regra
    /InitGame/
  end

  #regra para identificar o fim de jogo
  def self.fim_jogo_regra
    /--------+/
  end

  #regra para capturar o trecho onde apresenta quem matou e quem morreu
  def self.kill_regra
    /:\s([^:]+)\skilled\s(.*?)\sby/
  end

  #regra para capturar o quem matou, com base no kill_regra.
  def self.matou_regra
    /(?<=:\s)(.*?)(?=\skilled)/
  end

  #regra para capturar o quem morreu, com base no kill_regra.
  def self.morreu_regra
    /(?<=killed\s)(.*?)(?=\sby)/
  end
  
  #regra para vefiricar se existe informações do jogador
  def self.jogador_info_regra
    /ClientUserinfoChanged: \d n\\(.*?)\\/
  end

  #regra para capturar o nome do jogador
  #Retornado por self.jogador_info_regra
  def self.jogador_nome_regra
    /(?<=\\)(.*?)(?=\\)/
  end

  #metodos para usar as regras
  def self.inicio_jogo_linha?(linha_log)
    linha_log =~ ParseLog.inicio_jogo_regra
  end

  def self.fim_jogo_linha?(linha_log)
    linha_log =~ ParseLog.fim_jogo_regra
  end

  def self.morte_linha?(linha_log)
    linha_log =~ ParseLog.kill_regra
  end

  def self.jogador_linha?(linha_log)
    linha_log =~ ParseLog.jogador_info_regra
  end
end
