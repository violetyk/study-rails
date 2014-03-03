# encoding: utf-8

class Book
  attr_accessor :title, :author, :genre
  def initialize(title, author, genre=nil)
    @title  = title
    @author = author
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

  def each_title
    @booklist.each do |book|
      yield book.title
    end
  end

  # ブロック付きメソッド 複数
  def each_title_author
    @booklist.each do |book|
      yield book.title, book.author
    end
  end

  # ブロック付きメソッド 引数つき
  def find_by_author(author)
    if block_given? # ブロックが与えられた場合trueを返すメソッド
      @booklist.each do |book|
        # 著者がマッチした場合のみ
        if author =~ book.author
          yield book
        end
      end
    else
      result = []
      # ブロック突き出ない場合に、配列を返す
      @booklist.each do |book|
        if author =~ book.author
          result << book # result.push(book)とおなじ
        end
      end
      return result

      # Enumerable#selectメソッドを使って上と同じことをやる
      # @booklist.select do |book|
        # author =~ book.author
      # end
    end
  end

end

###############################################
booklist = BookList.new

b1 = Book.new('本の名前1', '山田太郎')
b2 = Book.new('本の名前2', '山田次郎')
b3 = Book.new('本の名前3', '山田三郎')

booklist.add(b1)
booklist.add(b2)
booklist.add(b3)

print booklist[0].title, "\n"
print booklist[1].title, "\n"
p '#############################################'
booklist.each do |book|
  print book.title, "\n"
end

p '#############################################'
booklist.each_title do |title|
  print title, "\n"
end

p '#############################################'
booklist.each_title_author do |title, author|
  print "「", title, "」", author, "\n"
end

p '#############################################'
# ブロック(do - end, { - })を渡す呼び方
booklist.find_by_author(/次郎/) do |book|
  print book.title, "\n"
end

p '#############################################'
# ブロックを渡さない呼び方
books = booklist.find_by_author(/次郎/)
books.each do |book|
  print book.title, "\n"
end

p '#############################################'
# ブロックをdo endではなくProcオブジェクトでも渡すことができる
# Procオブジェクトの手続き自体はブロック付きメソッドとして定義する
pr = Proc.new do
  p 'a'
end
p 'b'
pr.call()

p '#############################################'
