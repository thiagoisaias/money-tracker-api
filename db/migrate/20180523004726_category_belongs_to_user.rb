class CategoryBelongsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :user, index: true
  end
end
