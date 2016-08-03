class Jogador
  attr_accessor :nome, :kills

  def initialize(nome, kills=0)
    @nome = nome
    @kills = kills
  end

  def to_s
       "#{self.nome}: #{self.kills}"
  end


end
