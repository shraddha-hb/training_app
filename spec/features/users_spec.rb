require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  context 'create new user' do
		before(:each) do
			visit new_user_path
			within('form') do 
  			fill_in 'First name', with: 'Jon'
  			fill_in 'Last name', with: 'Doe'
  		end
		end

  	scenario 'should be successful' do 
			within('form') do
  			fill_in 'Email', with: 'jon.doe@example.com'
  		end
  		click_button 'Create User'
  		expect(page).to have_content('User was successfully created.')
  	end

  	scenario 'should fail' do 
  		click_button 'Create User'
  		expect(page).to have_content("Email can't be blank")
  	end
  end

  context 'update user' do
		let!(:user) {User.create(:first_name => 'Joe',:last_name => 'Doe',:email => 'jon.doe@example.com')}
  	before(:each) do
  		visit edit_user_path(user)  		
  	end

  	scenario 'should be successful' do 
			within('form') do 
  			fill_in 'First name', with: 'Jane'
  			fill_in 'Email', with: 'jane.doe@example.com'
  		end
  		click_button 'Update User'
  		expect(page).to have_content('User was successfully updated.')
  		expect(page).to have_content('jane.doe@example.com')
  	end

  	scenario 'should be successful' do 
  		within('form') do 
  			fill_in 'First name', with: ''
  		end
  		click_button 'Update User'
  		expect(page).to have_content('First name can\'t be blank')
  	end
  end

  context 'destroy user' do
  	scenario 'should be successful' do 
  		user = User.create(:first_name => 'Joe',:last_name => 'Doe',:email => 'jon.doe@example.com')
  		visit users_path
  		expect {click_link 'Destroy'}.to change(User, :count).by (-1)
  		expect(page).to have_content('User was successfully destroyed.')
  	end
  end
end
