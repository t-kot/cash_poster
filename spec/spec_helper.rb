require 'cash_poster'
require 'webmock/rspec'
require 'timecop'
require 'pry'

CashPoster::Config.setup do |config|
  config.api_url = 'https://api.cashpost.jp/api_receive.aspx'
  config.shop_id = '123456'
  config.check_code = '123456789876'
  config.send_ptncd = '000001'
  config.guide_ptn = '0'
  config.guide_tmpcd = 'M00001'
end
