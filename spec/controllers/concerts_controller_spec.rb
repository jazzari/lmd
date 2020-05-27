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
			Concert.recent.each_with_index do |concert, index|
              expect(json_data[index]['attributes']).to eq({ 
              	"title" => concert.title,
                "description" => concert.description }) 
            end
		end

		it 'should return concerts in the proper order' do 
			old_concert = create :concert 
			newer_concert = create :concert 
			subject
			expect(json_data.first['id']).to eq(newer_concert.id.to_s)
			expect(json_data.last['id']).to eq(old_concert.id.to_s)
		end

	end
end
