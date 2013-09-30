# coding: utf-8
module CashPoster
  module Request
    class Change < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(in_proctype: 'infchange')
      end
    end
  end
end
