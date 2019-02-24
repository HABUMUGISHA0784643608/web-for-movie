class ResumesController < ApplicationController   
  def index   
     @resumes = Resume.all   
  end   
     
  def new   
     @resume = Resume.new   
  end   
     
  def create   
     @resume = Resume.new(resume_params)   
        
     if @resume.save   
        redirect_to resumes_path, notice: "Successfully uploaded."   
     else   
        render "new"   
     end   
        
  end   
     
  def view   
     @resume = Resume.find(params[:id])   
     @resume.view   
     redirect_to resumes_path, notice:  "Successfully viewed."   
  end   
     
  private   
     def resume_params   
     params.require(:resume).permit(:title, :category, :releasedyear, :price, :attachment)   
  end   
     
end  