class RemoveSmalllinkFromThoughts < ActiveRecord::Migration
  def change
  	remove_column :thoughts, :small_link
  end
end
