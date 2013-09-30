# coding: utf-8
module CashPoster
  module Request
    class BaseRequest
      attr_reader :params

      def initialize(params = {})
        unless params[:order_id] && params[:amount]
          raise ArgumentError, 'You must specify order_id and amount'
        end

        @params = {
          in_shopid: CashPoster::Config.shop_id,
          in_chkCode: CashPoster::Config.check_code,
          in_orderno: params[:order_id],
          in_amount: params[:amount],
          in_sendptncd: CashPoster::Config.send_ptncd,
          in_guideptn: CashPoster::Config.guide_ptn,
          in_guidetmpcd: CashPoster::Config.guide_tmpcd
        }
      end
    end
  end
end
