class Admin::TextElementsController < Admin::BaseController
  sortable_attributes :var, :value
  
  def index
    @text_elements = TextElement.paginate :page => params[:page], :per_page => 20, :order => sort_order
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @text_elements }
    end
  end
  

  def show
    @text_element = TextElement.find(params[:id])
  end

  def update
    @text_element = TextElement.find(params[:id])

    respond_to do |format|
      if @text_element.update_attributes(params[:text_element])
        flash[:notice] = 'Text Element was successfully updated.'
        format.html { redirect_to(admin_text_elements_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @text_element.errors, :status => :unprocessable_entity }
      end
    end
  end
end

