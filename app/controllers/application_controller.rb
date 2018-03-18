require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  	set :session_secret, "mysecretcode"
  end

  get '/' do
  	erb :index
  end

  get '/failure' do 
    erb :failure
  end

  helpers do
		def logged_in?
			!!session[:email]
		end

    def instance_or_false(data_hash)
      teacher = Teacher.find_by(email: data_hash[:email])
      if teacher
        teacher
      else
        student = Student.find_by(email: data_hash[:email])
        if student
          student
        else
          admin = Admin.find_by(email: data_hash[:email])
          if admin
            admin
          else
            false
          end
        end
      end
    end

		def current_user
			instance_or_false(session)
		end

    def teacher_or_student
      
    end
		
	end

end