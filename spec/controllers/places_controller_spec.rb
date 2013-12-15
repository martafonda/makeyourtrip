require 'spec_helper'

describe PlacesController do
  let(:valid_attributes) { attributes_for(:place) }
  let(:valid_session) { {} }
  let(:city) { create(:city) }
  let(:place) { create(:place, city: city) }
  
  describe "GET index" do
    it "lists all places as @places" do
      get :index, {:city_id => city.to_param}, valid_session
      expect(assigns(:places)).to eq([place])
    end
  end

  describe "GET show" do
    it "assigns the requested place as @place" do
      get :show, {:city_id => city.to_param, :id => place.to_param},
        valid_session
      expect(assigns(:place)).to eq place
    end
  end

  describe "GET new" do
    it "assigns a new place as @place" do
      get :new, {:city_id => city.to_param}, valid_session
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe "GET edit" do
    it "asigns the requested place as @place" do
      get :edit, {:city_id => city.to_param, :id => place.to_param},
        valid_session
      expect(assigns(:place)).to eq place
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new place" do
        expect {
         post :create, {
          :city_id => city.to_param, 
          :place => valid_attributes
          }, valid_session  
        }.to change(city.places, :count).by(1)
      end

      it "assigns a newly created place as @place" do
        post :create, {
          :city_id => city.to_param, 
          :place => valid_attributes
          }, valid_session
        expect(assigns(:place)).to be_a(Place)
        expect(assigns(:place)).to be_persisted
      end

      it "redirects to the place's city" do
        post :create, {
          :city_id => city.to_param,
          :place => valid_attributes
          }, valid_session
        expect(response).to redirect_to(place_path(Place.last))
      end
    end 

    describe "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        Place.any_instance.stub(:save).and_return(false)
        post :create, {
          :city_id => city.to_param,
          :place => { "name" => "invalid value" }
          }, valid_session
        expect(assigns(:place)).to be_a_new(Place)
      end

      it "re-renders the 'new' template" do
        Place.any_instance.stub(:save).and_return(false)
        post :create, {
          :city_id => city.to_param, 
          :place => { "origin" => "invalid value" }
          }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested place" do
        Place.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {
          id: place.to_param, 
          :place => { "name" => "MyString" }
          }, valid_session
      end

      it "assigns the requested place as @place" do
        put :update, {
          id: place.to_param,
          :place => valid_attributes
          }, valid_session
        expect(assigns(:place)).to eq(place)
      end

      it "redirects to the place's city" do
        put :update, {
          id: place.to_param, 
          :place => valid_attributes
          }, valid_session
        expect(response).to redirect_to(place)
      end
    end

    describe "with invalid params" do
      it "assigns the place as @place" do
        Place.any_instance.stub(:save).and_return(false)
        put :update, {
          :id => place.to_param, 
          :place => { "name" => "invalid value" }
          }, valid_session
        assigns(:place).should eq(place)
      end

      it "re-renders the 'edit' template" do
        Place.any_instance.stub(:save).and_return(false)
        put :update, {
          :id => place.to_param, 
          :place => { "name" => "invalid value" }
          }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested place" do
      place = create(:place, city: city)
      expect {
        delete :destroy, {
          :city_id => city.to_param, 
          :id => place.to_param
          }, valid_session
      }.to change(city.places, :count).by(-1)
    end

    it "redirects to the places list" do
      delete :destroy, {
        :city_id => city.to_param, 
        :id => place.to_param
        }, valid_session
      expect(response).to redirect_to(cities_url)
    end
  end
end
