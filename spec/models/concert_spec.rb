require 'rails_helper'

RSpec.describe Concert, type: :model do

   describe '#validations' do

     it 'should test that the factory is valid' do 
     	expect(build :concert).to be_valid
     end

     it 'should validate presence of title' do 
     	concert = build :concert, title: '' 
     	expect(concert).not_to be_valid
     	expect(concert.errors.messages[:title]).to include("can't be blank")
     end

     it 'should validate presence of description' do 
     	concert = build :concert, description: ''
     	expect(concert).not_to be_valid
     	expect(concert.errors.messages[:description]).to include("can't be blank")
     end

   end

   describe '.recent' do 

   	it 'should list recent concert first' do
   	    old_concert = create :concert 
   	    newer_concert = create :concert 
   	    expect(described_class.recent).to eq([ newer_concert, old_concert ])
   	    old_concert.update_column :created_at, Time.now
   	    expect(described_class.recent).to eq([ old_concert, newer_concert ])
   	end

   end

end
