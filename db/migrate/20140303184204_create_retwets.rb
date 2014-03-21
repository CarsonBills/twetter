class CreateRetwets < ActiveRecord::Migration
  def change
    create_table :retwets do |t|
    	t.integer :user_id
    	t.integer :twet_id

    	t.timestamps
    end

    add_index :retwets, :user_id
  end
end
