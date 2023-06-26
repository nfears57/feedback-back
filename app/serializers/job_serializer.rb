class JobSerializer < ApplicationSerializer
  attributes :id
  has_many :applications
end
