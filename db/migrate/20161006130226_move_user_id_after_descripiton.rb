class MoveUserIdAfterDescripiton < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer, :after => :description
  end
end
