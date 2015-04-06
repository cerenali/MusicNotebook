class DropTags < ActiveRecord::Migration
  def up
    drop_table :tags
  end

  def down
    create_table :tags do |t|
      t.string :title

      t.timestamps        
    end
  end
end
