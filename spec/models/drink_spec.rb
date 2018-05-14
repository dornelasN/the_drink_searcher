require 'rails_helper'

describe Drink do
  describe 'validations' do
    subject { drink }

    let(:drink) { FactoryBot.build :drink }

    it { expect { drink.name = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.description = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.image_url = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.rating_avg = 6 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.alcohol_level = -1 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.ibu = 11 }.to change { drink.valid? }.from(true).to(false) }

    context 'should be searchable' do
      let(:drink) { FactoryBot.build :drink }
      
      it { 
        params = {name: drink.name}
        puts drink.name
        puts params
        drink_result = Drink.search(params)  
        puts drink_result
        expect(drink_result).to eq(drink)
      } 
    end
  end
end
