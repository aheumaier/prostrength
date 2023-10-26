require 'test_helper'
include ActionDispatch::TestProcess

class ProfileTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'test@example.com', password: 'password')
    @profile = @user.build_profile
  end

  test 'should be valid' do
    assert @profile.valid?
  end

  test 'should belong to user' do
    assert_respond_to @profile, :user
  end

  test 'should have one avatar attached' do
    assert_respond_to @profile, :avatar
  end

  test 'should not be valid without user' do
    @profile.user = nil
    assert_not @profile.valid?
  end

  test 'should save avatar' do
    file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    @profile.avatar.attach(file)
    assert @profile.avatar.attached?
  end
end
