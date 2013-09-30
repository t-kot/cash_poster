# coding: utf-8
module CashPoster
  class Response
    attr_accessor :request
    attr_reader :results

    def self.parse(body)
      instance = new
      instance.instance_eval do
        doc = Nokogiri::XML(body)
        @results = {
          shop_id: doc.xpath('//out_shopid').text,
          proctype: doc.xpath('//out_proctype').text,
          order_no: doc.xpath('//out_orderno').text,
          receive_no: doc.xpath('//out_receive_no').text,
          status: doc.xpath('//out_status').text,
          result_code: doc.xpath('//out_result').text,
          result_det: doc.xpath('//out_resultdet').text,
          result_content: doc.xpath('//out_resultcontent').text,
          endtime: doc.xpath('//out_endtime').text
        }
      end
      instance
    end

    def valid?
      @results[:result_code].to_i == 0
    end
  end
end
