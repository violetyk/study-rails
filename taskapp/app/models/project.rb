class Project < ActiveRecord::Base

  has_many :tasks

  # titleが空だとエラー
  # validates :title, presence: true
  #
  # 上と一緒。親クラスのvalidatesメソッドをクラス内でコールしている。
  # presence:は名前付き引数。
  # validates(:title, presence: true)

  # paperclipを使って画像アップロードを作ってみる
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    path: ":attachment/:id/:style/:filename",
    default_url: "/images/:style/missing.png",
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml"

  validates_attachment_content_type :avatar,
    content_type: /\Aimage\/.*\Z/

  validates :title,
    presence: {message:'入力してください'},
    length: {minimum: 3, message: '短すぎ！'}

end
