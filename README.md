# CashPoster

Cashpost(http://www.econtext.jp/service/cashpost) API Utility.

## Installation

Add this line to your application's Gemfile:

    gem 'cash_poster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cash_poster

## Usage

### Setting
In Rails, You should add config file to initializers.

For example.

```
CashPoster::Config.setup do |config|
  cashpost_config = YAML.load_file("#{::Rails.root}/config/cashpost.yml")[::Rails.env].symbolize_keys
  config.api_url = cashpost_config[:api_url]
  config.shop_id = '844005'
  config.check_code = cashpost_config[:check_code]
  config.send_ptncd = cashpost_config[:send_ptncd]
  config.guide_ptn = '0'
  config.guide_tmpcd = cashpost_config[:guide_tmpcd]
  config.proxy = { host: 'proxy.hoge.com', port: '8080' }
end

```

### Sample Register Request

```
req = CashPoster::Request::Register.new(
  order_id: '1234',
  email: 't.kotohata@gmail.com',
  receive_key: 'hogehoge', #=> 受け取り用のキー(前もってアプリ側で用意)
  amount: 10000 #=> 送金額
)
CashPoster::Transaction.new.execute(req) #=> #<CashPoster::Response>
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
