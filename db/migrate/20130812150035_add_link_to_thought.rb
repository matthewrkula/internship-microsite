class AddLinkToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :link, :string
  end
end
