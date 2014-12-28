
ActionDispatch::Routing::Mapper.class_eval do
  protected

  # Setup routes for +AutosigninController+.
  def devise_autosigninable(mapping, controllers)
    match "/:#{mapping.name}_id/autosignin/:autosignin_token" => 'devise/autosignin#create', :as => "autosignin", :via => :get
  end
end
