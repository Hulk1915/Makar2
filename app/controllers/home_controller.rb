class HomeController < ApplicationController
  include ActiveStorage::SetCurrent

  def index
  end

  def catalog
    # вытаскиваем из БД все книги
    @books = Book.all
  end

  def authors
    # вытаскиваем из БД все книги
    @authors = Author.all
  end

  def new_book
    # инициализируем новую книгу для добавления
    @book = Book.new
  end

  def add_book
    # создаем объект книги из POST запроса
    @book = Book.new(book_params)

    if @book.save
      # Сохранение файла изображения
      @book.image_url.attach(params[:book][:image_url])

      # Обработка успешного сохранения книги
      redirect_to '/', notice: 'Книга успешно добавлена'
    else
      # Обработка ошибок при сохранении книги
      render 'new_book'
    end
  end

  def book_index
    # ищем книгу по id
    @book = Book.find(params[:id])
  end

  # валидация параметров запросов
  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :description, :published_date, :image_url, :price)
  end
end
