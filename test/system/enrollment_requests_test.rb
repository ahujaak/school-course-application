require "application_system_test_case"

class EnrollmentRequestsTest < ApplicationSystemTestCase
  setup do
    @enrollment_request = enrollment_requests(:one)
  end

  test "visiting the index" do
    visit enrollment_requests_url
    assert_selector "h1", text: "Enrollment Requests"
  end

  test "creating a Enrollment request" do
    visit enrollment_requests_url
    click_on "New Enrollment Request"

    fill_in "Batch", with: @enrollment_request.batch_id
    fill_in "Status", with: @enrollment_request.status
    fill_in "Student", with: @enrollment_request.student_id
    click_on "Create Enrollment request"

    assert_text "Enrollment request was successfully created"
    click_on "Back"
  end

  test "updating a Enrollment request" do
    visit enrollment_requests_url
    click_on "Edit", match: :first

    fill_in "Batch", with: @enrollment_request.batch_id
    fill_in "Status", with: @enrollment_request.status
    fill_in "Student", with: @enrollment_request.student_id
    click_on "Update Enrollment request"

    assert_text "Enrollment request was successfully updated"
    click_on "Back"
  end

  test "destroying a Enrollment request" do
    visit enrollment_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enrollment request was successfully destroyed"
  end
end
