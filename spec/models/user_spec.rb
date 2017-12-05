require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'validation tests' do
    # let (:user) {build(:user)} #same as User.new does not save untill user.save
    # let (:user {build(:randome_user)}) #will use randome_user factory to generate randome users
    let (:user) { build(:randome_user,first_name: 'Dave')} # can pass extra parameter as well
    it 'ensure first name is present' do
      # let (:user) {create(:user)} #User.create
  		# user = User.new(:last_name => 'Last',:email => 'abc@gmail.com').save
      user.first_name = nil
  		expect(user.save).to eq(false)
  	end
  	it 'ensure last name is present' do
  		# user = User.new(:first_name => 'First',:email => 'abc@gmail.com').save
      user.last_name = nil
      expect(user.save).to eq(false)
  		# expect(user).to eq(false)
  	end
  	it 'ensure email name is present' do
  		# user = User.new(:last_name => 'Last',:first_name => 'First').save
      user.email = nil
  		expect(user.save).to eq(false)
  	end
  	it 'ensure user get validated' do
  		# user = User.new(:last_name => 'Last',:email => 'abc@gmail.com',:first_name => 'First').save
  		expect(user.save).to eq(true)
  	end
  end

  context 'scope tests' do
  	# let (:params) { {:first_name => 'First', :last_name => 'Last',:email => 'abc@gmail.com'} }

  	# before(:each) do 
  	# 	User.new(params).save
  	# 	User.new(params).save
  	# 	User.new(params.merge(:active => true)).save
  	# 	User.new(params.merge(:active => false)).save
  	# 	User.new(params.merge(:active => false)).save
  	# 	User.new(params.merge(:active => false)).save
  	# end

    let(:users) {create_list(:randome_user,6)}
    before(:each) do
      users.last(3).map {|u| u.update(:active => false)} 
    end
  	it 'should retuen all active users' do
  		expect(User.active_user.size).to eq(3)
  	end

  	it 'should retuen all in-active users' do
  		expect(User.inactive_user.size).to eq(3)
  	end
  end
end
