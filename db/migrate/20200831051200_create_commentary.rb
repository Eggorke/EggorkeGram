class CreateCommentary < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaries do |t|
      t.references :post
      t.references :user
      
      t.text :commentary_text
      t.timestamps
    end
  end
end
