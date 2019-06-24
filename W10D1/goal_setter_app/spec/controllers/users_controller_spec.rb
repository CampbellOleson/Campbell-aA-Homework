require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "renders the user index" do
            get :index
            expect(response).to render_template(:index)
        end
    end 

    describe "GET #show" do 
        it "renders the user show page" do 
            get :show
            expect(response).to render_template(:show)
        end
    end

    describe "GET #update" do
        it "renders user edit page" do 
            get :edit
            expect(response).to render_template(:edit)
        end
    end

    describe "GET #new" do
        it "renders new_user page" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do 
        context "with invalid params" do

            it "validates the presence of username and password" do 
                post :create, params: { user: { username: 'jack_bruce', password: '' } }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
            it "validates the password length is greater than 6" do 
                post :create, params: { user: { username: 'sam', password: 'hunt' } }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
        
        context "with valid params" do 

            it "redirect to users index page" do 
                post :create, params: { user: { username: 'jack_bruce', password: 'hunter12'} }
                expect(response).to render_template(:index)
            end

            it "saves the user to the database" do 
                post :create, params: { user: { username: 'jack_bruce', password: 'hunter12' } }
                user = User.find_by_credentials('jack_bruce', 'hunter12')
                expect(user).to be_present
            end

            it "logs the user in" do 
                post :create, params: { user: {username: 'jack_bruce', password: "hunter12"} }
                user = User.find_by_credentials('jack_bruce', 'hunter12')
                expect(session[:session_token]).to eq(user.session_token)
            end
        end 
    end

end
