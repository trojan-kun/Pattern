require_relative 'sub_system'

class Facade
  def initialize
    @word = Word.new
    @excel = Excel.new
    @pp = PowerPoint.new
  end

  def work_Word
    @word.open_app
    @word.write_a_book
    @word.close_app
  end

  def work_Excel
    @excel.open_app
    @excel.create_a_table
    @excel.close_app
  end

  def work_PP
    @pp.open_app
    @pp.create_a_presentation
    @pp.close_app
  end
end