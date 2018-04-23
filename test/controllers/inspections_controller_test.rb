require 'test_helper'

class QaSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qa_session = qa_sessions(:one)
  end

  test "should get index" do
    get qa_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_qa_session_url
    assert_response :success
  end

  test "should create qa_session" do
    assert_difference('QaSession.count') do
      post qa_sessions_url, params: { qa_session: { equipment_id: @qa_session.equipment_id, performed_at: @qa_session.performed_at } }
    end

    assert_redirected_to qa_session_url(QaSession.last)
  end

  test "should show qa_session" do
    get qa_session_url(@qa_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_qa_session_url(@qa_session)
    assert_response :success
  end

  test "should update qa_session" do
    patch qa_session_url(@qa_session), params: { qa_session: { equipment_id: @qa_session.equipment_id, performed_at: @qa_session.performed_at } }
    assert_redirected_to qa_session_url(@qa_session)
  end

  test "should destroy qa_session" do
    assert_difference('QaSession.count', -1) do
      delete qa_session_url(@qa_session)
    end

    assert_redirected_to qa_sessions_url
  end
end
