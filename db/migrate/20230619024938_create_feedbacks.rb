class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.boolean :like
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
