class ArticlesController < ApplicationController
	def index
    	@articles = Article.all

      # @data = params[:summary]
      # puts "summary"
      # puts params[:summary].inspect
      # puts summary
      # @data = summary

      # @my_time = Time.now
      # members=["U033UMSLR", "U0343N31K", "U0343PJV1", "U0343SVCR", "U0343TM6M", 
      # "U0343TR7B", "U0344095P", "U03441C99", "U0345833C", "U03458B66", "U03458UME", 
      # "U0345CYKL", "U0362QWCA", "U03S67M5A", "U054P0HHL", "U055ANZD5", "U0E487TL6", 
      # "U0HKU0DR8", "U0HKU9E06", "U0HKUDGNA", "U0HKUSDJ4", "U0JAT7WQ4"]
      client = Slack::Web::Client.new
      @data = client.users_list(user: 'U033UMSLR')
      # puts @data.members
      # puts @data
      # @members_count = @data.members[0].count
      # @data = client.channels.list




  	end

   	def show
    	@article = Article.find(params[:id])
  	end

	def new
		@article = Article.new
  	end

  	def edit
  		@article = Article.find(params[:id])
	end

  	def create
  		@article = Article.new(article_params)
 
  		if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
	end

	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

  def destroy
      @article = Article.find(params[:id])
      @article.destroy
 
      redirect_to articles_path
  end


 
	private
  		def article_params
    		params.require(:article).permit(:title, :text)
  		end

end




