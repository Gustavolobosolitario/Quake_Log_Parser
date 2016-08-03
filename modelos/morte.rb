class Morte
  attr_accessor :matou, :morreu

  def initialize(matou, morreu)
    @matou = matou
    @morreu = morreu
  end

  def to_s
  	"#{self.matou} matou #{self.morreu}"
  end

end
