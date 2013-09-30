# coding: utf-8
module CashPoster
  module Request
    class Status < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(in_proctype: 'getstatus')
      end
    end
  end
end
