require 'rails_helper'

describe ConcertsController do 

	describe '#index' do 

		it 'should return success response' do
		  get :index
		  expect(response).to have_http_status(:ok) 
		end

		it 'should return proper json' do 
			create_list :concert, 2
			get :index
			json = JSON.parse(response.body)
			json_data = json['data']
			expect(json_data.length).to eq(2)
            expect(json_data[0]['attributes']).to eq({ "title" => "Live Concert Nº 1",
              "description" => "Description of the Music Show Nº 1"}) 
            expect(json_data[1]['attributes']).to eq({ "title" => "Live Concert Nº 2",
              "description" => "Description of the Music Show Nº 2"})
		end

	end
end
