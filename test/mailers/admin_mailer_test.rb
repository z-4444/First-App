require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "new_user_waiting" do
    mail = AdminMailer.new_user_waiting
    assert_equal "New user waiting", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
