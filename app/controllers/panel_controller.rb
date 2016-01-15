class PanelController < FrontController
  def index
    @exams=@logged_user.exams
    @average=0
    @logged_user.contests.each do |contest|
      @average+=contest.mark
    end
    now=Time.now+8*3600
    @current=Exam.where("valid_from <= ? and valid_to >= ?",now,now)
  end

  def taken
    @exams=@logged_user.exams
  end

  def untaken
  	now=Time.now+8*3600
  	@current=Exam.where("valid_from <= ? and valid_to >= ?",now,now)
  	@not_ready=Exam.where("valid_from > ?",now)
  	@old=Exam.where("valid_to < ?",now)

  end

  def info
  	@user=@logged_user
  end

  def exam

  	user=@logged_user
  	if user.exams.find_by_id(params[:id])
  		redirect_to panel_untaken_url,notice:"您已经参加过这门考试"
  	end
  	begin
  		@exam=Exam.find(params[:id])
  	rescue Exception => e
  		redirect_to panel_untaken_url,notice:"没有找到这门考试"
  	end

  end
  def check
  	user=@logged_user
  	@answer=params[:answer]
  	if user.exams.find_by_id(params[:id])
  		redirect_to panel_untaken_url,notice:"您已经参加过这门考试"
  		return 
  	end
  	begin
  		exam=Exam.find(params[:id])
  	rescue Exception => e
  		redirect_to panel_untaken_url,notice:"没有找到这门考试"
  		return
  	end
  	@count=0
  	@right=0
  	@fault=0
  	@right_questions=[]
  	@fault_questions=[]
  	exam.questions.each do |question|
  		@count+=1
  		if value=@answer[question.id.to_s]
  			true_answer=question.answer.split(",")
  			common=true_answer&value
  			if common.size==true_answer.size
  				@right+=1
  				@right_questions<<{question: question ,answer: value}
  			else
  				@fault+=1
  				@fault_questions<<{question: question ,answer: value}
  			end
  		else
  			@fault+=1
  			@fault_questions<<{question: question ,answer: [""]}
  		end
  	end
  	@mark=@right*100/@count
  	Contest.create({exam_id:params[:id],user_id: user.id,mark: @mark})
  end
end
