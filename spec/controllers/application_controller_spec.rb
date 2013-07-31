require 'spec_helper'

describe ApplicationController do
  describe 'get_flag' do
    it 'returns the correct flag' do
      session[:i18n] = 'en'
      expect(@controller.get_flag).to eq 'us'
      session[:i18n] = 'fr'
      expect(@controller.get_flag).to eq 'fr'
      session[:i18n] = 'cs'
      expect(@controller.get_flag).to eq 'cs'
    end
  end
end
