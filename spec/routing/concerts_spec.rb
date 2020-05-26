require 'rails_helper'

describe 'concert routes' do 

		it 'should route to concerts index' do 
			expect(get '/concerts').to route_to('concerts#index')
		end

		it 'should route to concerts show' do 
			expect(get '/concerts/1').to route_to('concerts#show', id: '1')
		end

end
