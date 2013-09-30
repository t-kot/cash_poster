# coding: utf-8
module CashPoster
  module Request
    class Cancel < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(in_proctype: 'tcancel')
      end
    end
  end
end
