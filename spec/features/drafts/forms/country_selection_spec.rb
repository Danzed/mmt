require 'rails_helper'

describe 'Country selection', js: true do
  context 'when selecting a Country' do
    before do
      login
      draft = create(:draft, user: User.where(urs_uid: 'testuser').first)
      visit draft_path(draft)

      within '.metadata' do
        click_on 'Data Identification'
      end

      open_accordions

      within '#organizations' do
        select 'United States', from: 'Country'
      end
    end

    it 'changes the State / Province text field to a select field' do
      expect(page).to have_field('State / Province', type: 'select')
    end

    it 'populates the select field with the correct options' do
      expect(page).to have_select('State / Province', with_options: ['Alaska'])
    end

    context 'when selecting a different country' do
      before do
        within '#organizations' do
          select 'United Kingdom', from: 'Country'
        end
      end

      it 'updates the select with the correct options' do
        expect(page).to have_select('State / Province', with_options: ['Aberdeenshire'])
      end
    end

    context 'when selecting "Select Country" from the country field' do
      before do
        within '#organizations' do
          select 'Select Country', from: 'Country'
        end
      end

      it 'changes the State / Province select back to a text field' do
        expect(page).to have_field('State / Province', type: 'text')
      end
    end
  end
end
