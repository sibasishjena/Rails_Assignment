require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    context 'matcher index check' do
        before {get :index}
        it {should render_template('index')}
    end
    context 'Get index' do
        it 'returns a success response' do
            get :index
            expect(response).to be_successful
        end
    end
end
