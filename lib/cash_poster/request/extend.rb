# coding: utf-8
module CashPoster
  module Request
    class Extend < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(in_proctype: 'rextend')
      end
    end
  end
end
