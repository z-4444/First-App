ActiveAdmin.register Article do
  # <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment 
  #
  permit_params :title, :text, :user_id, :status

  scope :approved
  scope :pending


  show do
    attributes_table do
      row :id
      row :title
      row :user
      row :status
      row "Text" do |article|
        raw article.text
      end
      row :created_at
      row :updated_at
      row "Total_Comments" do |article|
        article.comments.count
      end
    end
    active_admin_comments
  end


  index do
    selectable_column
    column :id
    column :title
    column :user
    column "Current status" do |article|
      article.status
    end
    column "Total Comments" do |article|
    article.comments.count
    end
    column "Text" do |article|
      raw article.text
    end
    actions dropdown: true
    # actions do |article|
    #   if article.pending?
    #   # debugger
    #   item 'Approved',approved_admin_article_path(article), method: :put 
    #   end
    # end
    column "Change status" do |article|
      if article.pending?
        link_to 'Approved' , approved_admin_article_path(article), method: :put
      end
    end

    
    
  end


  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text, :user_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # @article=Article.find(params[:id])


  member_action :approved, method: :put do
    resource.approved!
    @article=Article.find(params[:id])
    # debugger
    ArticleMailer.article_approved(@article).deliver_later
    redirect_to admin_articles_path
  end

  action_item :approved ,only: :show, if: proc {!resource.approved?}  do
    # debugger
     link_to 'Approved',[:approved, :admin, resource] , method: :put 
  end

  member_action :pending, method: :put do
    resource.pending!
    redirect_to resource_path
  end

  action_item :pending ,only: :show, if: proc {!resource.pending?}  do
    # debugger
     link_to 'Pending',[:pending, :admin, resource] , method: :put 
  end



  form do |f|
    f.inputs do
        f.input :title
        f.input :text, as: :ckeditor ,src:"https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"
        f.input :status
        f.input :user
        # f.input :user_id, as: :hidden, value: current_admin_user.article_user_id
    end
    f.actions
  end

  controller do
    def create
    
      @article = Article.new(params[:article])
      
      if @article.save
        redirect_to admin_articles_path
      else
        render :new
      end
    end
   end
   def edit
    @article=Article.find(params[:id]) 
   end

  def update
    @article=Article.find(params[:id]) 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

end
