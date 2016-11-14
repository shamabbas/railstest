require 'grape-swagger'
module Testapp
  class Request < Grape::API
    format :json
    # prefix 'api' # could have set prefix api
    # version 'v1', using: :path # This can be used for version control as big projects may have various versions
    rescue_from :all

    add_swagger_documentation(
        hide_documentation_path: true,
        markdown: GrapeSwagger::Markdown::KramdownAdapter
    )

    error_formatter :json, lambda { |message, backtrace, options, env|
                           {
                               status: 'failed',
                               message: message,
                               error_code: 500
                           }.to_json

                         }

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    # Get All Owners
    # GET url = /owners
    #Response: [{"id":1,"name":"James","created_at":"2016-11-13T23:19:32.249Z","updated_at":"2016-11-13T23:19:32.249Z"}]
    resource :owners do
      get '/' do
        Owner.all
      end
    end

    # Get Owner by name
    # GET url = /:owner_name = /James
    #Response: {"id":1,"name":"James","created_at":"2016-11-13T23:19:32.249Z","updated_at":"2016-11-13T23:19:32.249Z"}
    get '/:owner_name' do
      Owner.find_by_name(params[:owner_name])
    end

    # Get # url /:owner_name/articles = /James/articles
    #Response: {"owner_name":"James","articles":[{"id":1,"owner_id":1,"name":"First article","description":"This is test","price":"1.22","created_at":"2016-11-13T23:20:08.897Z","updated_at":"2016-11-13T23:20:08.897Z"}]}
    resource "/" do
      params do
        requires :owner_name, type: String
      end
      get '/:owner_name/articles' do
        owner = Owner.find_by_name(params[:owner_name])
        unless owner.blank?
          unless owner.articles.blank?
            p owner.articles
            {
                owner_name: owner.name,
                articles: owner.articles
            }
          else
            {
                status: 'error',
                message: 'Problem occurred! Please try again later'
            }
          end
        else
          {
              status: 'error',
              message: 'No Article exist for this owner!'
          }
        end
      end
    end

    # Get Article by id
    # GET url = /articles/:id
    # Response: {"id":1,"name":"First article","description":"This is test","price":"1.22","owner_name":"James"}
    get '/articles/:id' do
      Article.select('own.name as owner_name, articles.id, articles.name, articles.price, articles.description')
          .joins(' LEFT JOIN owners as own on own.id = articles.owner_id ')
          .where(' articles.id = ? ', params[:id]).first if params[:id]
    end

  end
end