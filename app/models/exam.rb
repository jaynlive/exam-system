class Exam < ActiveRecord::Base
	validates_presence_of :name,:administrator_id,message:"不能为空"
	validates_uniqueness_of :name,message:"必须是唯一的"
	validates_numericality_of :timespan,message:"应当是一个数字"
	# validates_format_of :valid_from,:valid_to,with:/\d{4}-\d{2}-\d{2}/,message:"不是一个合法的日期格式'YYYY-mm-dd hh-MM'"
	belongs_to :administrator
	has_and_belongs_to_many :questions
	has_many :contests
	has_many :users,through: :contests

	# private

		def add_questions_to_exam(qsts)
			unless id.nil? || qsts.nil?
				qsts.each do |question|
				  # updatesql= "insert exams_questions set exam_id= #{id} ,question_id = #{question.id}"
      #               # +"where user_id=#{uid} and document_id = #{@document.id}"
  				# ActiveRecord::Base.connection.update(updatesql) 
					questions<<question
				end
			else
	        errors.add(:题目列表,"不能为空")
			end
		end
		
		def self.get_valid_exam
			Exam.all
		end
end
