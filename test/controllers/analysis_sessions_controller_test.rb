require 'test_helper'

class AnalysisSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_session = analysis_sessions(:one)
  end

  test "should get index" do
    get analysis_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_session_url
    assert_response :success
  end

  test "should create analysis_session" do
    assert_difference('AnalysisSession.count') do
      post analysis_sessions_url, params: { analysis_session: {  } }
    end

    assert_redirected_to analysis_session_url(AnalysisSession.last)
  end

  test "should show analysis_session" do
    get analysis_session_url(@analysis_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_session_url(@analysis_session)
    assert_response :success
  end

  test "should update analysis_session" do
    patch analysis_session_url(@analysis_session), params: { analysis_session: {  } }
    assert_redirected_to analysis_session_url(@analysis_session)
  end

  test "should destroy analysis_session" do
    assert_difference('AnalysisSession.count', -1) do
      delete analysis_session_url(@analysis_session)
    end

    assert_redirected_to analysis_sessions_url
  end
end
