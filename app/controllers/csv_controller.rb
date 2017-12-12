class	CsvController < ApplicationController
  def index
    @upload_form = UploadForm.new
  end
        
  def upload
    @upload_form = UploadForm.new(upload_form_params)
    if @upload_form.import
      redirect_to upload_path, notice: 'インポートしました。'
    else
      render :index
    end
  end
        
  def upload_form_params
    params.fetch(:upload_form, {}).permit(:file)
  end
end
