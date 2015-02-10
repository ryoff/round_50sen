class Float
  def round_50sen
    return (self - 0.5).ceil if self >= 0

    (self + 0.5).floor
  end
end
