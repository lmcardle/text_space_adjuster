class AnalyzeTextsController < ApplicationController
    
  def new
  end
  
  def create
    text_results = AnalyzeText.analyze(params[:text])
    
    
    redirect_to analyze_texts_path(text_results: text_results)
  end
  
  def index
    @text_results = params[:text_results]
    respond_to do |format|
      format.html 
      format.json { render json: @text_results }
    end
  end
  
end