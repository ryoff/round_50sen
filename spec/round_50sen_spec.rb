require 'spec_helper'
require 'pry'

describe "#round_50sen " do
  describe Integer do
    where(:integer, :rounded) do
      [
        [0, 0],
        [1, 1],
        [-1, -1],
        [99, 99],
      ]
    end

    with_them do
      subject { integer.round_50sen }

      it { is_expected.to eq rounded }
    end
  end

  describe Float do
    where(:float, :rounded) do
      [
        [0.50, 0],
        [0.51, 1],
        [1.49, 1],
        [1.50, 1],
        [1.51, 2],
        [1.50000000, 1],
        [1.50000001, 2],
        [-0.50, -0],
        [-0.51, -1],
        [-1.49, -1],
        [-1.50, -1],
        [-1.51, -2],
        [-1.50000000, -1],
        [-1.50000001, -2],
      ]
    end

    with_them do
      subject { float.round_50sen }

      it { is_expected.to eq rounded }
    end
  end

  describe BigDecimal do
    where(:big_decimal, :rounded) do
      [
        [BigDecimal('0.50'), 0],
        [BigDecimal('0.51'), 1],
        [BigDecimal('1.49'), 1],
        [BigDecimal('1.50'), 1],
        [BigDecimal('1.51'), 2],
        [BigDecimal('1.50000000'), 1],
        [BigDecimal('1.50000001'), 2],
        [BigDecimal('1.50000000000000000000000000000000000000'), 1],
        [BigDecimal('1.50000000000000000000000000000000000001'), 2],
        [BigDecimal('-0.50'), -0],
        [BigDecimal('-0.51'), -1],
        [BigDecimal('-1.49'), -1],
        [BigDecimal('-1.50'), -1],
        [BigDecimal('-1.51'), -2],
        [BigDecimal('-1.5000000000000000000000000000000000000'), -1],
        [BigDecimal('-1.5000000000000000000000000000000000001'), -2],
      ]
    end

    with_them do
      subject { big_decimal.round_50sen }

      it { is_expected.to eq rounded }
    end
  end
end
