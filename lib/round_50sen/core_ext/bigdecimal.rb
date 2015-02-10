require 'bigdecimal'
class BigDecimal
  def round_50sen(n = 0)
    return (self - BigDecimal('0.5')).ceil(n) if self >= 0

    (self + BigDecimal('0.5')).floor(n)
  end
end
