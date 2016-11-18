require 'bigdecimal'
class BigDecimal
  def round_50sen(n = 0)
    round(n, BigDecimal::ROUND_HALF_DOWN)
  end
end
