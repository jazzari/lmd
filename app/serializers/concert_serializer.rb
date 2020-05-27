class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
end

class ConcertSerializer < ApplicationSerializer
  attributes :title, :description
end
