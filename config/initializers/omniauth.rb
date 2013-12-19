Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'HcI9zaJYcMTAKB6mSxjLQ', 'HPrhCOeA3uLGvOGBj2mj9zK06knlFFumLVmhb3nR75s' # Please don't steal me :)  For a real application, these would have to be stored on the production server and not in source control.
end
