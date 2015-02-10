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
    context 'without args' do
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

    context 'with args is 4' do
      where(:big_decimal, :rounded) do
        [
          [BigDecimal('0.50'), 0.5],
          [BigDecimal('0.51'), 0.51],
          [BigDecimal('1.49'), 1.49],
          [BigDecimal('1.50'), 1.5],
          [BigDecimal('1.51'), 1.51],
          [BigDecimal('1.50000000'), 1.5],
          [BigDecimal('1.50000001'), 1.5],
          [BigDecimal('1.55555000'), 1.5555],
          [BigDecimal('1.55555001'), 1.5556],
          [BigDecimal('1.55555000000000000000000000000000000000'), 1.5555],
          [BigDecimal('1.55555000000000000000000000000000000001'), 1.5556],
          [BigDecimal('-0.50'), -0.5],
          [BigDecimal('-0.51'), -0.51],
          [BigDecimal('-1.49'), -1.49],
          [BigDecimal('-1.50'), -1.50],
          [BigDecimal('-1.51'), -1.51],
          [BigDecimal('-1.55555000'), -1.5555],
          [BigDecimal('-1.55555001'), -1.5556],
          [BigDecimal('-1.55555000000000000000000000000000000000'), -1.5555],
          [BigDecimal('-1.55555000000000000000000000000000000001'), -1.5556],
        ]
      end

      with_them do
        subject { big_decimal.round_50sen(4) }

        it { is_expected.to eq rounded }
      end
    end

    context 'with args is minus 1' do
      where(:big_decimal, :rounded) do
        [
          [BigDecimal('0.50'), 0],
          [BigDecimal('15.0'), 10],
          [BigDecimal('15.1'), 20],
          [BigDecimal('15.000000000000000000000000000000000'), 10],
          [BigDecimal('15.000000000000000000000000000000001'), 20],
          [BigDecimal('-15.0'), -10],
          [BigDecimal('-15.1'), -20],
          [BigDecimal('-15.000000000000000000000000000000000'), -10],
          [BigDecimal('-15.000000000000000000000000000000001'), -20],
        ]
      end

      with_them do
        subject { big_decimal.round_50sen(-1) }

        it { is_expected.to eq rounded }
      end
    end

    context 'with args is minus 4' do
      where(:big_decimal, :rounded) do
        [
          [BigDecimal('0.50'), 0],
          [BigDecimal('15000.0'), 10000],
          [BigDecimal('15000.1'), 20000],
          [BigDecimal('15000.000000000000000000000000000000000'), 10000],
          [BigDecimal('15000.000000000000000000000000000000001'), 20000],
          [BigDecimal('-15000.0'), -10000],
          [BigDecimal('-15000.1'), -20000],
          [BigDecimal('-15000.000000000000000000000000000000000'), -10000],
          [BigDecimal('-15000.000000000000000000000000000000001'), -20000],
        ]
      end

      with_them do
        subject { big_decimal.round_50sen(-4) }

        it { is_expected.to eq rounded }
      end
    end
  end
end
