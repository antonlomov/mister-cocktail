class AddReferences < ActiveRecord::Migration
  def change
    add_reference :doses, :cocktail, index:true
    add_reference :doses, :ingredient, index:true

  end
end
