require 'rails_helper'


describe InformativoService, type: :service do
  describe '.import_stocks' do
    context 'when a api is available' do
      before do
        stub_request(:get, %r{/securities\?security_types%5B%5D=STOCK})
          .to_return(
            status: 200,
            body: fixture('informativos/stock_response.json')
          )
      end
      it 'expect to import more than one stock' do
        expect do
          subject.import_stocks
        end.to change(Security, :count).by 0
      end
    end
  end

 describe '.import_prices' do 
    context 'when api is available' do 
      before do
        stub_request(:get,  %r{/prices/#{SecuritysClosingPrice.shift_date(Date.today - 1)}\?security_types%5B%5D=STOCK})
          .to_return(
            status: 200, 
            body: fixture('informativos/price_response.json')
          )
      end 
      it 'expect to import more than one price' do 
        expect do 
            subject.import_prices 
        end.to change(SecuritysClosingPrice, :count).by 412
      end
    end
  end
end


