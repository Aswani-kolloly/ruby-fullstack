require 'csv'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @book = Book.new
    # native query in ruby with raw sql
    @books =  ActiveRecord::Base.connection.execute("select *from books")
    @subjects=Subject.all
  end

  def main
    @book = Book.new
    @books = Book.all
    @subjects=Subject.all
    @recent_book=Book.last
    
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    
    @book = Book.new
    @subjects=Subject.all
  end

  # GET /books/1/edit
  def edit
    @subjects=Subject.all
    
    
  end

  # POST /books or /books.json
  def create
    p "book params"
    p book_params
    @book = Book.new(book_params)
    @subjects=Subject.all
    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

# GET /books or /books.json
def posts
  @books = Book.paginate(page: params[:page], per_page: 3)
end

  # POST /books or /books.json
  def save
    p "book params"
    p book_params
    # @book = Book.new(book_params.merge(price: current_user.id.to_i))
    @book = Book.new(book_params)
    @subjects=Subject.all
   
    respond_to do |format|
      if @book.save
        @book.image.attach(params[:image])
        @recent_book=Book.last
        #@book=Book.new
        format.html { redirect_to '/' }
        #format.json { render :show, status: :created, location: @book }
      else
        @recent_book=Book.last
        format.html { render :main,status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|      
      if @book.update(book_params)
        if params[:image].present?
          @book.image.attach(params[:image])
        end
        format.html { redirect_to '/books', notice: "Book was successfully updated." }
        #format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  #CSV - export database table to csv format(having exact table fields as column heads)
  def export_csv

    csv_data=Book.all
   
      header = "Book Name,Price,Description"
      file = "book_list.csv"
      CSV.open( file, 'w' ) do |writer|
        writer << csv_data.first.attributes.map { |a,v| a }
        csv_data.each do |s|
          writer << s.attributes.map { |a,v| v }
        end
      end
      send_file(file)
    
  end

  #CSV - export database table to csv format(taking only specific table fields as column heads)
  def csv_data

    csv_data=Book.all
    file = "book_list.csv"
    CSV.open( file, 'w' ) do |csv|
      column_names = %w( Name  Description  Price )
      csv << column_names
      csv_data.each do |book_data|
        csv << [book_data.title, book_data.description,book_data.price]
      end
    end
      send_file(file)
    
  end


  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to '/books', notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
     
    end

    # Only allow a list of trusted parameters through.
    def book_params
      #params.fetch(:book, {})
      params.require(:book).permit(:title,:price,:subject_id,:description,:image)
    end
  end
