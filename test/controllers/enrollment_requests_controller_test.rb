require "test_helper"

class EnrollmentRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment_request = enrollment_requests(:one)
  end

  test "should get index" do
    get enrollment_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_request_url
    assert_response :success
  end

  test "should create enrollment_request" do
    assert_difference('EnrollmentRequest.count') do
      post enrollment_requests_url, params: { enrollment_request: { batch_id: @enrollment_request.batch_id, status: @enrollment_request.status, student_id: @enrollment_request.student_id } }
    end

    assert_redirected_to enrollment_request_url(EnrollmentRequest.last)
  end

  test "should show enrollment_request" do
    get enrollment_request_url(@enrollment_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrollment_request_url(@enrollment_request)
    assert_response :success
  end

  test "should update enrollment_request" do
    patch enrollment_request_url(@enrollment_request), params: { enrollment_request: { batch_id: @enrollment_request.batch_id, status: @enrollment_request.status, student_id: @enrollment_request.student_id } }
    assert_redirected_to enrollment_request_url(@enrollment_request)
  end

  test "should destroy enrollment_request" do
    assert_difference('EnrollmentRequest.count', -1) do
      delete enrollment_request_url(@enrollment_request)
    end

    assert_redirected_to enrollment_requests_url
  end
end
