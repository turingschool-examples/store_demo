require 'spec_helper'

describe I18nController do
  describe 'update' do
    it 'changes the language' do
      session[:i18n] = 'en'
      request.env["HTTP_REFERER"] = '/'
      post :update, locale: 'fr'
      expect(session[:i18n]).to eq 'fr'
    end
  end
end
