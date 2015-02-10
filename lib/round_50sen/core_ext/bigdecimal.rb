require 'bigdecimal'
class BigDecimal
  def round_50sen(n = 0)
    digits = n >= 0 ? '0.1' : '10'
    adjuster = BigDecimal('0.5') * BigDecimal(digits) ** n.abs

    return (self - adjuster).ceil(n) if self >= 0

    (self + adjuster).floor(n)
  end
end
