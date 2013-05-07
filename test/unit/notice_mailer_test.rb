require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "created" do
    @expected.subject = 'NoticeMailer#created'
    @expected.body    = read_fixture('created')
    @expected.date    = Time.now

    assert_equal @expected.encoded, NoticeMailer.create_created(@expected.date).encoded
  end

  test "modified" do
    @expected.subject = 'NoticeMailer#modified'
    @expected.body    = read_fixture('modified')
    @expected.date    = Time.now

    assert_equal @expected.encoded, NoticeMailer.create_modified(@expected.date).encoded
  end

  test "canceled" do
    @expected.subject = 'NoticeMailer#canceled'
    @expected.body    = read_fixture('canceled')
    @expected.date    = Time.now

    assert_equal @expected.encoded, NoticeMailer.create_canceled(@expected.date).encoded
  end

end
