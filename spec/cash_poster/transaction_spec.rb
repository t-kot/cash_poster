require 'spec_helper'

describe CashPoster::Transaction do
  let(:api_url) { 'https://api.test.com/cashpost' }
  before do
    CashPoster::Config.setup do |config|
      config.api_url = api_url
    end
    stub_request(:post, api_url).to_return(body: response, status: 200)
  end

  let(:response) do
    <<-EOS
    <?xml version=\"1.0\" encoding=\"shift_jis\"?>
      <result>
        <out_shopid>123456</out_shopid>
        <out_proctype>tregister</out_proctype>
        <out_orderno>123456</out_orderno>
        <out_receiveNo>123456</out_receiveNo>
        <out_status></out_status>
        <out_result>0</out_result>
        <out_resultdet>0000</out_resultdet>
        <out_resultcontent>hogehoge</out_resultcontent>
        <out_endtime>20130930103233</out_endtime>
      </result>
    </xml>
    EOS
  end

  let(:request) do
    CashPoster::Request::Register.new(email: 'hoge@fuga.com', receive_key: 'hoge', amount: 10000, order_id: '1234')
  end

  describe '.parsed_uri' do
    it { expect(CashPoster::Transaction.parsed_uri).to be_instance_of(URI::HTTPS) }
  end

  describe '#execute' do
    context 'When request is valid' do
      it { expect(CashPoster::Transaction.new.execute(request)).to be_instance_of(CashPoster::Response) }
    end

    context 'When request is invalid' do
      before { stub_request(:post, api_url).to_return(status: 400) }
      it { expect { CashPoster::Transaction.new.execute(request) }.to raise_error(CashPoster::Error) }
    end
  end
end
