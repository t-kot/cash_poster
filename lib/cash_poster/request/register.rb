# coding: utf-8
module CashPoster
  module Request
    class Register < BaseRequest
      def initialize(params = {})
        super(params)
        @params = @params.merge(
          in_proctype: 'tregister',
          in_mailadd: params[:email],
          in_receivekey1: params[:receive_key]
        )
      end
    end
  end
end
