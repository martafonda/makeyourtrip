require 'spec_helper'

describe TravelticketsController do

  let(:valid_attributes) { attributes_for(:travelticket) }
  let(:valid_session) { {} }
  let(:city) { create(:city) }
  let(:travelticket) { create(:travelticket, city: city) }
  
  describe "GET index" do
    it "lists all traveltickets as @traveltickets" do
      get :index, {:city_id => city.to_param}, valid_session
      expect(assigns(:traveltickets)).to eq([travelticket])
    end
  end

  describe "GET show" do
    it "assigns the requested travelticket as @travelticket" do
      get :show, {:city_id => city.to_param, :id => travelticket.to_param},
        valid_session
      expect(assigns(:travelticket)).to eq travelticket
    end
  end

  describe "GET new" do
    it "assigns a new travelticket as @travelticket" do
      get :new, {:city_id => city.to_param}, valid_session
      expect(assigns(:travelticket)).to be_a_new(Travelticket)
    end
  end

  describe "GET edit" do
    it "asigns the requested travelticket as @travelticket" do
      get :edit, {:city_id => city.to_param, :id => travelticket.to_param},
        valid_session
      expect(assigns(:travelticket)).to eq travelticket
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new travelticket" do
        expect {
         post :create, {
          :city_id => city.to_param, 
          :travelticket => valid_attributes
          }, valid_session  
        }.to change(city.traveltickets, :count).by(1)
      end

      it "assigns a newly created travelticket as @travelticket" do
        post :create, {
          :city_id => city.to_param, 
          :travelticket => valid_attributes
          }, valid_session
        expect(assigns(:travelticket)).to be_a(Travelticket)
        expect(assigns(:travelticket)).to be_persisted
      end

      it "redirects to the travelticket's city" do
        post :create, {
          :city_id => city.to_param,
          :travelticket => valid_attributes
          }, valid_session
        expect(response).to redirect_to(travelticket_path(Travelticket.last))
      end
    end 

    describe "with invalid params" do
      it "assigns a newly created but unsaved travelticket as @travelticket" do
        Travelticket.any_instance.stub(:save).and_return(false)
        post :create, {
          :city_id => city.to_param,
          :travelticket => { "origin" => "invalid value" }
          }, valid_session
        expect(assigns(:travelticket)).to be_a_new(Travelticket)
      end

      it "re-renders the 'new' template" do
        Travelticket.any_instance.stub(:save).and_return(false)
        post :create, {
          :city_id => city.to_param, 
          :travelticket => { "origin" => "invalid value" }
          }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested travelticket" do
        Travelticket.any_instance.should_receive(:update).with({ "origin" => "MyString" })
        put :update, {
          id: travelticket.to_param, 
          :travelticket => { "origin" => "MyString" }
          }, valid_session
      end

      it "assigns the requested travelticket as @travelticket" do
        put :update, {
          id: travelticket.to_param,
          :travelticket => valid_attributes
          }, valid_session
        expect(assigns(:travelticket)).to eq(travelticket)
      end

      it "redirects to the travelticket's city" do
        put :update, {
          id: travelticket.to_param, 
          :travelticket => valid_attributes
          }, valid_session
        expect(response).to redirect_to(travelticket)
      end
    end

    describe "with invalid params" do
      it "assigns the travelticket as @travelticket" do
        Travelticket.any_instance.stub(:save).and_return(false)
        put :update, {
          :id => travelticket.to_param, 
          :travelticket => { "origin" => "invalid value" }
          }, valid_session
        assigns(:travelticket).should eq(travelticket)
      end

      it "re-renders the 'edit' template" do
        Travelticket.any_instance.stub(:save).and_return(false)
        put :update, {
          :id => travelticket.to_param, 
          :travelticket => { "origin" => "invalid value" }
          }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested travelticket" do
      travelticket = create(:travelticket, city: city)
      expect {
        delete :destroy, {
          :city_id => city.to_param, 
          :id => travelticket.to_param
          }, valid_session
      }.to change(city.traveltickets, :count).by(-1)
    end

    it "redirects to the movies list" do
      delete :destroy, {
        :city_id => city.to_param, 
        :id => travelticket.to_param
        }, valid_session
      expect(response).to redirect_to(cities_url)
    end
  end
end

