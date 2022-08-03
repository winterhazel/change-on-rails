class Comment < ApplicationRecord
  include Visible

  belongs_to :petition
end
