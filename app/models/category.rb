class Category < ApplicationRecord
  validates_presence_of :description, message: "Descrição deve ser preenchido"
end
