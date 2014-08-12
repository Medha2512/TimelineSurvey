class AddContentToEducationtransitions < ActiveRecord::Migration
  def change
    add_column :educationtransitions, :content, :string
  end
end
