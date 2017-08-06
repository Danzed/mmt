# MMT-23

require 'rails_helper'

describe 'Search sorting', reset_provider: true, js: true do
  context 'when sorting search collections results' do
    before :all do
      publish_draft(short_name: 'First!', modified_date: (Time.now.utc - 5.days))

      publish_draft(short_name: '0000_Aardvark Short Name')
      publish_draft(short_name: 'Zimbabwe Short Name')

      publish_draft(entry_title: '0000_Aardvark Entry Title')
      publish_draft(entry_title: 'Zimbabwe Entry Title')

      publish_draft(short_name: 'Last!', modified_date: (Time.now.utc + 5.days))
    end

    before do
      login
      fill_in 'keyword', with: 'MMT_2'
      click_on 'Search Collections'
    end

    context 'by Short Name' do
      before do
        click_on 'Sort by Short Name Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Short Name Asc')
      end

      it 'sorts the results by Short Name Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('Aardvark Short Name')
        end
        # expect(page).to have_no_content('SAMMIGEO')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Short Name Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Short Name Desc')
        end

        it 'sorts the results by Short Name Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Zimbabwe Short Name')
          end
          # expect(page).to have_no_content('ACR3L2DM')
        end
      end
    end

    context 'by Entry Title' do
      before do
        click_on 'Sort by Entry Title Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Entry Title Asc')
      end

      it 'sorts the results by Entry Title Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('Aardvark Entry Title')
        end
        # expect(page).to have_no_content('MISR Level 1B1 Radiance Data V002')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Entry Title Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Entry Title Desc')
        end

        it 'sorts the results by Entry Title Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Zimbabwe Entry Title')
          end
          # expect(page).to have_no_content('2000 Pilot Environmental Sustainability Index (ESI)')
        end
      end
    end

    context 'by Last Modified' do
      before do
        click_on 'Sort by Last Modified Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Last Modified Asc')
      end

      it 'sorts the results by Last Modified Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('First!')
        end
        # expect(page).to have_no_content('MISR Level 1B1 Radiance Data V002')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Last Modified Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Last Modified Desc')
        end

        it 'sorts the results by Last Modified Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Last!')
          end
          # expect(page).to have_no_content('2000 Pilot Environmental Sustainability Index (ESI)')
        end
      end
    end

    context 'by Entry Title' do
      before do
        click_on 'Sort by Entry Title Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Entry Title Asc')
      end

      it 'sorts the results by Entry Title Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('Arctic Cooling Heating Vectors')
        end
        # expect(page).to have_no_content('Zimbabwe Evapotranspiration')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Entry Title Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Entry Title Desc')
        end

        it 'sorts the results by Entry Title Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Zimbabwe Evapotranspiration')
          end
          # expect(page).to have_no_content('Arctic Cooling Heating Vectors')
        end
      end
    end

    context 'by Last Modified' do
      before do
        click_on 'Sort by Last Modified Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Last Modified Asc')
      end

      it 'sorts the results by Last Modified Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('Arctic Cooling Heating Vectors')
        end
        # expect(page).to have_no_content('Zimbabwe Evapotranspiration')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Last Modified Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Last Modified Desc')
        end

        it 'sorts the results by Last Modified Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Zimbabwe Evapotranspiration')
          end
          # expect(page).to have_no_content('Arctic Cooling Heating Vectors')
        end
      end
    end

    context 'by Provider' do
      before do
        click_on 'Sort by Provider Asc'
      end

      it 'displays the correct search param' do
        expect(page).to have_search_query(nil, 'Sort Key: Provider Id Asc')
      end

      it 'sorts the results by Provider Id Asc' do
        within '#search-results tbody tr:nth-child(1)' do
          expect(page).to have_content('Arctic Cooling Heating Vectors')
        end
        # expect(page).to have_no_content('Zimbabwe Evapotranspiration')
      end

      context 'when sorting again' do
        before do
          click_on 'Sort by Provider Desc'
        end

        it 'displays the correct search param' do
          expect(page).to have_search_query(nil, 'Sort Key: Provider Id Desc')
        end

        it 'sorts the results by Provider Id Desc' do
          within '#search-results tbody tr:nth-child(1)' do
            expect(page).to have_content('Zimbabwe Evapotranspiration')
          end
          # expect(page).to have_no_content('Arctic Cooling Heating Vectors')
        end
      end
    end
  end
end
