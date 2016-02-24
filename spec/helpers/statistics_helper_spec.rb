require 'rails_helper'

RSpec.describe StatisticsHelper, type: :helper do
  describe StatisticsHelper do
    describe 'string concat' do
      it 'rounds number value with 2 digits after' do
        expect(helper.format_avg_rating(8.512)).to eq(8.51)
        expect(helper.format_avg_rating(8.526)).to eq(8.53)
      end
    end
  end
end
