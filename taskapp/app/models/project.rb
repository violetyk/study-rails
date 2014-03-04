class Project < ActiveRecord::Base

  has_many :tasks

  # titleが空だとエラー
  # validates :title, presence: true
  #
  # 上と一緒。親クラスのvalidatesメソッドをクラス内でコールしている。
  # presence:は名前付き引数。
  # validates(:title, presence: true)
 
  validates :title,
    presence: {message:'入力してください'},
    length: {minimum: 3, message: '短すぎ！'}

end
