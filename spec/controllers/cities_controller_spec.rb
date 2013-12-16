require 'spec_helper'

describe CitiesController do

  let(:valid_city_attributes) { attributes_for(:city) }
  let(:city) { create(:city) }
  let(:valid_session) { {} }

  describe "City" do
    describe "GET index" do
      it "assigns all cities as @cities" do
        get :index, {}, valid_session
        expect(assigns(:cities)).to eq([city])
      end
    end

    describe "GET show" do
      it "assigns the requested city as @city" do
        get :show, {:id => city.to_param}, valid_session
        expect(assigns(:city)).to eq(city)
      end
    end

    describe "GET new" do
      it "assigns a new city as @city" do
        get :new, {}, valid_session
        expect(assigns(:city)).to be_a_new(City)
      end
    end

    describe "GET edit" do
      it "assigns the requested city as @city" do
        get :edit, {:id => city.to_param}, valid_session
        expect(assigns(:city)).to eq(city)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new City" do
          expect {
            post :create, {
              :city => valid_city_attributes
              }, valid_session
          }.to change(City, :count).by(1)
        end

        it "assigns a newly created city as @city" do
          post :create, {
            :city => valid_city_attributes
            }, valid_session
          expect(assigns(:city)).to be_a(City)
          expect(assigns(:city)).to be_persisted
        end

        it "redirects to the created city" do
          post :create, {:city => valid_city_attributes}, valid_session
          expect(response).to redirect_to(City.last)
        end
      end

      describe "with invalid params" do
        before(:each) do
          City.any_instance.stub(:save).and_return(false)
        end
        it "assigns a newly created but unsaved city as @city" do
          post :create, {:city => { "name" => "invalid value" }}, valid_session
          expect(assigns(:city)).to be_a_new(City)
        end

        it "re-renders the 'new' template" do
          post :create, {:city => { "name" => "invalid value" } }, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested city" do
          City.any_instance.should_receive(:update).with({ "name" => "Madrid" })
          put :update, {
            :id => city.to_param, 
            :city => { "name" => "Madrid" }
            }, valid_session
        end

        it "assigns the requested city as @city" do
          put :update, {
            :id => city.to_param, 
            :city => valid_city_attributes
            }, valid_session
          expect(assigns(:city)).to eq(city)
        end

        it "redirects to the city" do
          put :update, {
            :id => city.to_param, 
            :city => valid_city_attributes
            }, valid_session
          expect(response).to redirect_to(city)
        end
      end

      describe "with invalid params" do
        it "assigns the city as @city" do
          City.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => city.to_param, 
            :city => { "title" => "invalid value" }
            }, valid_session
          assigns(:city).should eq(city)
        end

        it "re-renders the 'edit' template" do
          City.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => city.to_param, 
            :city => { "name" => "invalid value" }
            }, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested city" do
        city = create(:city)
        expect {
          delete :destroy, {:id => city.to_param}, valid_session
        }.to change(City, :count).by(-1)
      end

      it "redirects to the movies list" do
        delete :destroy, {:id => city.to_param}, valid_session
        expect(response).to redirect_to(cities_url)
      end
    end
  end
end
