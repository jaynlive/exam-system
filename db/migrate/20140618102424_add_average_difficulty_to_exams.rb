class AddAverageDifficultyToExams < ActiveRecord::Migration
  def change
    ###在exams表添加字段average_difficulty，类型为decimal，长度为5，小数点保留2位
    add_column :exams, :average_difficulty, :decimal,precision: 5, scale: 2
  end
end
