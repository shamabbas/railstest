Rails.application.routes.draw do
  # set root path

  # API+API Documentation
  mount GrapeSwaggerRails::Engine => '/apidoc'
  mount Testapp::Request => '/'

end
