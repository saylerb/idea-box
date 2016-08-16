RSpec.describe "idea endpoint" do

  context "retrieve idea information" do

    let!(:idea) { create(:idea) }
    let!(:idea2) { create(:idea) }

    it "returns the information for all ideas" do
      get "/api/v1/ideas"

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(response).to be_success

      idea1_data, idea2_data = data.first, data.last

      expect(idea1_data.length).to eq(3)
      expect(idea1_data[:title]).to eq(idea1.name)
      expect(idea1_data[:body]).to eq(idea1.description)
      expect(idea1_data[:quality]).to eq('swill')

      expect(idea2_data.length).to eq(3)
      expect(idea2_data[:title]).to eq(idea2.name)
      expect(idea2_data[:body]).to eq(idea2.description)
      expect(idea2_data[:quality]).to eq('swill')
    end
  end
end

