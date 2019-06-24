require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) {User.new(email:"jrainbow@trollol",password: "121wqfdscv")}

  describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    context "when password length < 6" do 
      it "should invalidate password length" do 
          short_password = User.new(email: '123@123', password: '1')
          expect(short_password.valid?).to eq(false)
        end
      end
    context "when password length > 6" do 
      it "should validate password length" do 
        long_password = User.new(email: '123@123', password: 'dwgsbfdfa1')
        expect(long_password.valid?).to eq(true)
        end
      end
  end

end
