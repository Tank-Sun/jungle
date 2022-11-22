require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have same password and password_confirmation' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '5678')
      @user.save
      expect(@user.errors.messages[:password_confirmation]).to include('doesn\'t match Password')
    end
    it 'should have both password and password_confirmation' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'should have both password and password_confirmation' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password_confirmation: '5678')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'should not have same email addresses' do
      @user1 = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user2 = User.new(first_name: 'Ali', last_name: 'Baba', email: 'TaoBao.com', password: '1234', password_confirmation: '1234')
      @user1.save
      @user2.save
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end
    it 'should have email' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'should have first name' do
      @user = User.new(last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'should have last name' do
      @user = User.new(first_name: 'Ali', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'should have password longer than 8 characters' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '123', password_confirmation: '123')
      @user.save
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user with correct email and password' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user.save
      user = User.authenticate_with_credentials('taobao.com', '1234')
      expect(user).to be_present
    end
    it 'should return nil with wrong email or password' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user.save
      user1 = User.authenticate_with_credentials('jingdong.com', '1234')
      user2 = User.authenticate_with_credentials('taobao.com', '4567')
      expect(user1).to be_nil
      expect(user2).to be_nil
    end
    it 'should be permitted to log in with a few spaces before and/or after their email address' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.com', password: '1234', password_confirmation: '1234')
      @user.save
      user = User.authenticate_with_credentials('  taobao.com  ', '1234')
      expect(user).to be_present
    end
    it 'should be permitted to log in with wrong case of their email address' do
      @user = User.new(first_name: 'Ali', last_name: 'Baba', email: 'taobao.COM', password: '1234', password_confirmation: '1234')
      @user.save
      user = User.authenticate_with_credentials('TaOBAo.com', '1234')
      expect(user).to be_present
    end
  end
end
