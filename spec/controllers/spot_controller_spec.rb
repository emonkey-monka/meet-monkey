require 'rails_helper'

RSpec.describe CsvController, type: :controller do

  describe "Csv #upload" do
    it "returns http success" do
      get :upload
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
