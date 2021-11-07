class AddDescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :createdat, :datetime
    add_column :articles, :updatedat, :datetime
  end
end
