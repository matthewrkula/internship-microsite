class AddColorToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :color, :string
    add_column :thoughts, :small_link, :string
  end
end
