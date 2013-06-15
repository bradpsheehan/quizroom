require 'spec_helper'

describe ClassroomsController do

  describe '#create' do

    context "given valid parameters" do

      xit "sends JSON to classroom service" do
        params = {name: "English 101", teacher_id: 1}
        controller.stub(:response).and_return({name: "English 101", id: 1})
        post :create, :classroom => params

        expect(json_response[:name]).to eq("English 101")
        expect(json_response.status).to eq 200
      end
    end

    context "given invalid parameters" do

      xit "sends JSON without a classroom name to classroom service" do
        params = {name: "", teacher_id: 1}
        response.stub(:body).with({errors: {name: ["can't be blank"]}}.to_json)
        post :create, classroom: params
        json_response = JSON.parse(response.body).with_indifferent_access

        expect(json_response[:errors]).to eq({"name"=>["can't be blank"]})
      end
    end
  end

end