class Territory < ApplicationRecord
  after_create_commit { TerritoryBroadcastJob.perform_later self }
end
