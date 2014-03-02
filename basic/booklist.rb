# encoding: utf-8

class Book
  attr_accessor :title, :author, :genre
  def initialize(title, auther, genre=nil)
    @title  = title
    @auther = auther
    @genre  = genre
  end
end


class BookList
  # 初期化
  def initialize()
    @booklist = Array.new
  end

  # 追加
  def add(book)
    @booklist.push(book)
  end

  # 札数を返す
  def length
    @booklist.length
  end

  # 配列参照演算子を定義
  def []=(n, book)
    @booklist[n] = book
  end

  def [](n)
    @booklist[n]
  end

  # 本をリストから削除する
  def delete(book)
    @booklist.delete(book)
  end

  # ブロック付きメソッドeachを定義
  def each
    @booklist.each do |book|
      # yieldの引数がブロック変数に代入される
      yield book
    end
  end
end

###############################################
booklist = BookList.new

b1 = Book.new('本の名前1', '著者A')
b2 = Book.new('本の名前2', '著者B')

booklist.add(b1)
booklist.add(b2)

print booklist[0].title, "\n"
print booklist[1].title, "\n"
###############################################

booklist.each do |book|
  print book.title, "\n"
end

###############################################
