require 'spec_helper'

describe CashPoster::Response do
  let(:body) do
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

  describe '.parse' do
    it { expect(CashPoster::Response.parse(body)).to be_instance_of(CashPoster::Response) }
  end

  describe '#valid?' do
    subject { CashPoster::Response.parse(body) }

    context 'result code is 0' do
      it { should be_valid }
    end

    context 'result code is not 0' do
      let(:body) do
        <<-EOS
        <?xml version=\"1.0\" encoding=\"shift_jis\"?>
          <result>
            <out_shopid>123456</out_shopid>
            <out_proctype>tregister</out_proctype>
            <out_orderno>123456</out_orderno>
            <out_receiveNo>123456</out_receiveNo>
            <out_status></out_status>
            <out_result>1</out_result>
            <out_resultdet>0000</out_resultdet>
            <out_resultcontent>hogehoge</out_resultcontent>
            <out_endtime>20130930103233</out_endtime>
          </result>
        </xml>
        EOS
      end

      it { should_not be_valid }
    end
  end
end
