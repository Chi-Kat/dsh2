class AddPicPwDigest < ActiveRecord::Migration

  def change
    add_column :users, :image, :string
    add_column :users, :password_digest, :string
    add_column :classrooms, :stat, :text
    add_column :classrooms, :description, :text
  end

end
