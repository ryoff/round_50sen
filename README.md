# Round50sen

50銭以下を切り捨て、50銭より多い場合は切り上げる`round_50method`を、Integer/Float/BigDecimalに生やすgemです

[厚生労働省：雇用保険の一般保険料額表の廃止と被保険者負担額の算定について](http://www.mhlw.go.jp/topics/2005/04/tp0425-2.html)

>５０銭以下の場合は切り捨て、５０銭１厘以上の場合は切り上げとなります。

```rb
[1] pry(main)> 0.50.round_50sen
=> 0
[2] pry(main)> 0.51.round_50sen
=> 1
[3] pry(main)> 0.round_50sen
=> 0
[4] pry(main)> 1.round_50sen
=> 1
[6] pry(main)> BigDecimal('0.50000000000000000000000000000000000000').round_50sen.to_f
=> 0.0
[7] pry(main)> BigDecimal('0.50000000000000000000000000000000000001').round_50sen.to_f
=> 1.0
[8] pry(main)> BigDecimal('0.5550000000000000000000000000000000000000').round_50sen(2).to_f
=> 0.55
[9] pry(main)> BigDecimal('0.5550000000000000000000000000000000000001').round_50sen(2).to_f
=> 0.56
[10] pry(main)> BigDecimal('15000.00000000000000000000000000000000000000').round_50sen(-4).to_f
=> 10000.0
[11] pry(main)> BigDecimal('15000.00000000000000000000000000000000000001').round_50sen(-4).to_f
=> 20000.0
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'round_50sen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install round_50sen

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/round_50sen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
