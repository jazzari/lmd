require 'rails_helper'

describe ConcertsController do 

	describe '#index' do 
		subject { get :index }

		it 'should return success response' do
		  subject
		  expect(response).to have_http_status(:ok) 
		end

		it 'should return proper json' do 
			concerts = create_list :concert, 2
			subject
			concerts.each_with_index do |concert, index|
              expect(json_data[index]['attributes']).to eq({ 
              	"title" => concert.title,
                "description" => concert.description }) 
            end
		end

	end
end
