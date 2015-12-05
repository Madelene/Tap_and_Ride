	
class UserPostTest < ActionDispatch::IntegrationTest
	test 'creates user' do
		post '/users',
		myJSObject = {user:{ email: "user@example.com", password:"password",password_conformation:"password",first_name:"User1_first", last_name:"User1_last",phone:"1234567890"}}.to_json,
		{'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type
	end
end