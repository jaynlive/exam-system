json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :description,  :timespan,:average_difficulty
  json.questions exam.questions
  json.provider exam.administrator.username
  json.url exam_url(exam, format: :json)
end
