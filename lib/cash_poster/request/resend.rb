# coding: utf-8
module CashPoster
  module Request
    class Resend < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(in_proctype: 'tresend')
      end
    end
  end
end
