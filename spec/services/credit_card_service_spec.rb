require 'rails_helper'
require 'stripe_mock'

RSpec.describe CreditCardService do
  context "Create Customer" do

    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after { StripeMock.stop }

    it "creates customer in stripe" do

      email = Faker::Internet.email
      card = stripe_helper.generate_card_token

      customer = CreditCardService.new(email: email, card: card).create_customer

      expect(customer.email).to eq(email)
    end
  end
end