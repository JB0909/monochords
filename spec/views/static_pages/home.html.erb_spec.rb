require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do
  describe 'home.html.erbのテスト' do
    it 'h1タグ内にHello Worldが表示されるか' do
      visit root_path
      expect(page).to have_selector('h1', text:'Hello World')
    end
  end
end
