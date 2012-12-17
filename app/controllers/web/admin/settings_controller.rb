class Web::Admin::SettingsController < Web::Admin::ApplicationController
  
  def new
    @settings = Settings.all
  end

  def create
    store_string :site_name
    store_string :phone
    store_file :logo
    store_file :header_image

    flash[:notice] = "Settings was successfully updated"
    redirect_to new_admin_setting_path
  end

  private 
    def store_string(key)
      Settings[key] = params[:settings][key] if params[:settings][key]
    end
    
    def store_file(key)
      if params[:settings][key]
        uploader = SettingsUploader.new
        uploader.store! params[:settings][key]
        Settings[key] = uploader.store_path
      end
    end
end
