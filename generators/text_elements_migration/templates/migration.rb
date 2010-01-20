class CreateTextElements < ActiveRecord::Migration
  def self.up
    create_table :text_elements do |t|
      t.string :var, :null => false
      t.text :value
      
      t.timestamps
    end
    add_index :text_elements, :var
  end

  def self.down
    remove_index :text_elements, :var
    drop_table :text_elements
  end
end