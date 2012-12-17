class Web::Admin::SettingsController < Web::Admin::ApplicationController
  
  def new
    @settings = Settings.all
  end

  def create
    params[:settings].each do |k, v|
      Settings[k] = v
    end

    flash[:notice] = "Settings was successfully updated"
    redirect_to new_admin_setting_path
  end
end
