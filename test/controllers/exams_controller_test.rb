require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    login_as :admin if defined? session
    @exam = exams(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:exams)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create exam" do
  #   assert_difference('Exam.count') do
  #     post :create, exam: { description: @exam.description, name: @exam.name, teacher_id: @exam.teacher_id, timespan: @exam.timespan, valid_from: @exam.valid_from, valid_to: @exam.valid_to }
  #   end

  #   assert_redirected_to exam_path(assigns(:exam))
  # end

  # test "should show exam" do
  #   get :show, id: @exam
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @exam
  #   assert_response :success
  # end

  # test "should update exam" do
  #   patch :update, id: @exam, exam: { description: @exam.description, name: @exam.name, teacher_id: @exam.teacher_id, timespan: @exam.timespan, valid_from: @exam.valid_from, valid_to: @exam.valid_to }
  #   assert_redirected_to exam_path(assigns(:exam))
  # end

  # test "should destroy exam" do
  #   assert_difference('Exam.count', -1) do
  #     delete :destroy, id: @exam
  #   end

  #   assert_redirected_to exams_path
  # end
end
