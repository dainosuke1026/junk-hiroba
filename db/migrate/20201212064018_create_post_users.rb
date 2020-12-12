class CreatePostUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :post_users do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
