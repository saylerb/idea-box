RSpec.describe "idea endpoint" do

  context "retrieve idea information" do

    let!(:idea1) { create(:idea) }
    let!(:idea2) { create(:idea) }

    it "returns the information for all ideas" do
      get "/api/v1/ideas"

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(response).to be_success

      idea1_data, idea2_data = data.first, data.last

      expect(idea1_data.length).to eq(4)
      expect(idea1_data[:id]).to eq(idea1.id)
      expect(idea1_data[:title]).to eq(idea1.title)
      expect(idea1_data[:title]).to eq(idea1.title)
      expect(idea1_data[:body]).to eq(idea1.body)
      expect(idea1_data[:quality]).to eq('swill')

      expect(idea2_data.length).to eq(4)
      expect(idea2_data[:id]).to eq(idea2.id)
      expect(idea2_data[:title]).to eq(idea2.title)
      expect(idea2_data[:body]).to eq(idea2.body)
      expect(idea2_data[:quality]).to eq('swill')
    end
  end

  context "alter idea data" do
    let!(:idea1) { create(:idea) }
    let!(:idea2) { create(:idea) }

    it "deletes an idea" do
      expect(Idea.where(id: idea1.id, title: idea1.title)).to exist
      expect(Idea.where(id: idea2.id, title: idea2.title)).to exist
      
      delete "/api/v1/ideas/#{idea1.id}"

      expect(response.status).to eq(204)
      expect(Idea.where(id: idea1.id, title: idea1.title)).to_not exist
      expect(Idea.where(id: idea2.id, title: idea2.title)).to exist
    end

    it "creates an idea" do
      new_idea_params = { title: "Start Cubby Stuffers", 
                          body: "delicious", 
                          quality: "genius"
                        }

      post "/api/v1/ideas", params: { idea: new_idea_params }

      expect(response.status).to eq(201)

      new_idea_data = JSON.parse(response.body, symbolize_names: :true)

      expect(new_idea_data[:title]).to eq(new_idea_params[:title])
      expect(new_idea_data[:body]).to eq(new_idea_params[:body])
      expect(new_idea_data[:quality]).to eq(new_idea_params[:quality])

      new_idea = Idea.last

      expect(new_idea.title).to eq(new_idea_params[:title])
      expect(new_idea.body).to eq(new_idea_params[:body])
      expect(new_idea.quality).to eq(new_idea_params[:quality])
    end

    it "updates an idea" do
      expect(Idea.where(id: idea1.id, title: idea1.title)).to exist

      edit_idea_params = { title: "Buy oreos", 
                          body: "This is awesome!", 
                          quality: "genius"
                        }

      patch "/api/v1/ideas/#{idea1.id}", params: { idea: edit_idea_params}

      expect(response.status).to eq(204)

      edit_idea_data = JSON.parse(response.body, symbolize_names: :true)

      expect(edit_idea_data[:title]).to eq(edit_idea_params[:title])
      expect(edit_idea_data[:body]).to eq(edit_idea_params[:body])
      expect(edit_idea_data[:quality]).to eq(edit_idea_params[:quality])

      edit_idea = Idea.last

      expect(edit_idea.title).to eq(edit_idea_params[:title])
      expect(edit_idea.body).to eq(edit_idea_params[:body])
      expect(edit_idea.quality).to eq(edit_idea_params[:quality])
    end
  end
end
