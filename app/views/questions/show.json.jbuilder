json.extract! @question, :id, :title, :description
json.options @question.options.split(",")
json.answer @question.answer.split(",")
json.extract! @question,:multiple, :difficulty
json.provider @question.administrator.username
json.extract! @question,:created_at, :updated_at
