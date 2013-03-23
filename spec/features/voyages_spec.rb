require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Voyages' do
  let(:admin) {FactoryGirl.create(:admin_traveler)}
  let(:voyage) {FactoryGirl.create(:voyage)}
  let(:zep) {FactoryGirl.create(:zeppelin)}
  before(:each) do
    voyage.zeppelin = zep
    voyage.save
    visit root_path
    #admin = FactoryGirl.create(:admin_traveler)
  end

  describe 'GET /voyages' do
    it 'displays the New Voyage button', :js=>true do
      login_to_system(admin)
      click_link('Voyages')
      click_link('New Voyage')
    end
    it 'displays all voyages', :js=>true do
      login_to_system(admin)
      click_link('Voyages')
      page.should have_text('Clipper Class')
    end
  end

  describe 'GET /voyages/new' do
    it 'displays the New Voyage form', :js=>true do
      login_to_system(admin)
      visit voyages_path
      page.should have_link('New Voyage')
    end
  end

  # describe 'POST /voyages' do
  #   it 'creates a Voyage in the db', :js=>true do
  #     login_to_system(admin)
  #     visit voyages_path
  #     click_link('New Voyage')
  #     fill_in('voyage[code]', :with=>voyage.code)
  #     fill_in('voyage_airfield_depart', :with=>voyage.airfield_depart)
  #     fill_in('voyage_airfield_arrive', :with=>voyage.airfield_arrive)
  #     fill_in('voyage_voyage_date', :with=>voyage.voyage_date)
  #     select(zep.style, :from=>'voyage_zeppelin_id')
  #     click_button('Create Voyage')
  #     expect(voyage.id).to_not eq nil
  #   end
  # end

  # describe 'POST /voyages' do
  #   it 'creates a Voyage in the db', :js=>true do
  #     login_to_system(admin)
  #     click_link('Voyages')
  #     click_link('New Voyage')
  #     fill_in('Code', :with=>voyage.code)
  #     fill_in('voyage_airfield_depart', :with=>voyage.airfield_depart)
  #     fill_in('voyage_airfield_arrive', :with=>voyage.airfield_arrive)
  #     fill_in('voyage_voyage_date', :with=>voyage.voyage_date)
  #     select(zep.style, :from=>'voyage_zeppelin_id')
  #     click_button('Create Voyage')
  #     expect(voyage.id).to_not eq nil
  #   end
  # end


end

