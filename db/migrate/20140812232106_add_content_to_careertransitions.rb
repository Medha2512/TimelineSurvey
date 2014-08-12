class AddContentToCareertransitions < ActiveRecord::Migration
  def change
    add_column :careertransitions, :content, :string
  end
end
