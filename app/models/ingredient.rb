class Ingredient < ActiveRecord::Base
  has_many :doses
  before_destroy :check_for_doses
  validates :name, presence:true, uniqueness:true

private
  def check_for_doses
  if Ingredient.doses.count > 0
    errors.add_to_base("you cannot delete Ingredient while dose exists")
    return false
  end
end
end





