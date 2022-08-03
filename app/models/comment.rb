class Comment < ApplicationRecord
  include Visible

  belongs_to :petition
  belongs_to :user
end
