module ParseLog

  #regra para identificar o inicio de jogo
  def self.inicio_jogo_regra
    /InitGame/
  end

  #regra para identificar o fim de jogo
  def self.fim_jogo_regra
    /--------+/
  end

  #regra para verificar o numero de mortes (kill) por jogo
  def self.kill_regra
    /Kill:/
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