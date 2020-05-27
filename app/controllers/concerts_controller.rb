class ConcertsController < ApplicationController 

	def index
		concerts = Concert.all
		render json: serializer.new(concerts) 
	end

	def show
	end

  private

    def serializer
    	ConcertSerializer
    end
	
end