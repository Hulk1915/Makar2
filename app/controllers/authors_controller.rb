class AuthorsController < ApplicationController
  def new
    # инициализируем нового автора для добавления
    @author = Author.new
  end

  def add_author
    # создаем объект автора из POST запроса
    @authpr = Author.new(author_params)

    if @authpr.save
      # Обработка успешного сохранения автора
      redirect_to '/books/new', notice: 'Автор успешно добавлен'
    else
      # Обработка ошибок при сохранении Автор
      render :new
    end
  end

  # валидация параметров запросов
  private

  def author_params
    params.require(:author).permit(:name, :biography, :birth_date, :website)
  end
end
