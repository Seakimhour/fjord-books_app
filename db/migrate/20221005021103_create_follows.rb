class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.bigint :follower_id
      t.bigint :following_id
    end

    add_index :follows, [:follower_id, :following_id], unique: true
  end
end
