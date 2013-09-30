require 'active_support/core_ext'
require 'net/https'
require 'uri'
require 'kconv'
require 'nokogiri'
require 'cash_poster/request'
require 'cash_poster/response'
require 'cash_poster/transaction'
require 'cash_poster/error'

module CashPoster
  module Config
    mattr_accessor :api_url, :shop_id, :check_code,
      :send_ptncd, :guide_ptn, :guide_tmpcd,
      :proxy

    def self.setup
      yield self
    end
  end
end
