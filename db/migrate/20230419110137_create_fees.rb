class CreateFees < ActiveRecord::Migration[6.1]
  def change
    create_table :fees do |t|
      t.references :deal
      t.timestamps
    end
  end
end
