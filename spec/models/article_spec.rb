require 'rails_helper'

describe Article do
  context 'scopes' do
    describe '::by_name_or_text' do
      it 'filters by name or text' do
        FactoryBot.create_list(:article, 10)
        articles_with_name = FactoryBot.create_list(:article, 3, name: "Eureka!")
        articles_with_text = FactoryBot.create_list(:article, 2, content: "Eureka! It was a successful spec.")

        expect(described_class.count).to eq(15)
        expect(described_class.by_name_or_text('Eureka!').size).to eq(5)
      end
    end
  end
end
