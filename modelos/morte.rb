class Morte
  attr_accessor :matou, :morreu, :causa_morte

  def initialize(matou, morreu, causa_morte)
    @matou = matou
    @morreu = morreu
    @causa_morte = causa_morte
  end

  def to_s
  	"#{self.matou} matou #{self.morreu} tipo da morte #{self.causa_morte}"
  end

end
