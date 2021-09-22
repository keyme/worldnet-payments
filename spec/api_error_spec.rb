require 'spec_helper'

describe WorldnetPayments::ApiError do
  it 'parses non-named arguments as the message' do
    expect(WorldnetPayments::ApiError.new('Connection timed out').to_s).to eq 'Connection timed out'
  end
end
