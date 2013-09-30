# coding: utf-8
module CashPoster
  class Transaction
    def self.parsed_uri
      @parsed_uri ||= URI.parse(CashPoster::Config.api_url)
    end

    def execute(request)
      uri = Transaction.parsed_uri
      if proxy = CashPoster::Config.proxy
        http = Net::HTTP::Proxy(proxy[:host], proxy[:port]).new(uri.host, uri.port)
      else
        http = Net::HTTP.new(uri.host, uri.port)
      end
      http.use_ssl = true
      http.ssl_version = 'SSLv3'
      http_req = Net::HTTP::Post.new(uri.path)
      http_req.body = request.params.to_query
      http_res = http.request(http_req)

      case http_res
      when Net::HTTPSuccess
        CashPoster::Response.parse(http_res.body)
          .tap { |res| res.request = request }
      else
        raise CashPoster::Error
      end
    end
  end
end
