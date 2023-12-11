class GenresController < ApplicationController
  def new
    # инициализируем новый жанр для добавления
    @genre = Genre.new
  end

  def add_genre
    # создаем объект жанра из POST запроса
    @genre = Genre.new(genre_params)

    if @genre.save
      # Обработка успешного сохранения жанра
      redirect_to '/books/new', notice: 'Жанр успешно добавлен'
    else
      # Обработка ошибок при сохранении жанра
      render :new
    end
  end

  # валидация параметров запросов
  private

  def genre_params
    params.require(:genre).permit(:name, :description)
  end
end
