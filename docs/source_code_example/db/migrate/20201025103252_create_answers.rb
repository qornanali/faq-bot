class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :question_type, null: false
      t.string :text, null: false

      t.timestamps
    end

    add_index :answers, :question_type, unique: true
  end
end
