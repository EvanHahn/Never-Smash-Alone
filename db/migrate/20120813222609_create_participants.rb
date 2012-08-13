class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :message_id
      t.integer :user_id
      t.boolean :sender
      t.datetime :read_at

      t.timestamps
    end
  end
end
