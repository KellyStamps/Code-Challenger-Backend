class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :content
      t.string :rating
      t.string :links

      t.timestamps
    end
  end
end
