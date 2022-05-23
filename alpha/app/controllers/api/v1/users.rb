module API
    module V1
      class Users < Grape::API
        include API::V1::Defaults
        resource :users do
          desc "Return all users"
          get "" do
            User.all
          end
        desc "Return a user"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            User.where(id: permitted_params[:id]).first!
          end

        desc "Add blocked_dates to user"

          params do 
              requires :email, type: String, desc: "Add blocked date if user exists"
              requires :begin_at, type: Date, desc: "block dates to add"
              requires :end_at, type: Date, desc: "block dates to add"
          end

          post "add_blocked_dates_to_user" do
              
              user = User.find_by(email: params[:email])

              unless user.nil?
                  user.blocked_dates.create(begin_at: params[:begin_at], end_at: params[:end_at])
              end

          end  
      
        end
      end
    end
  end