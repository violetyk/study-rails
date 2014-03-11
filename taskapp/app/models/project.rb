class Project < ActiveRecord::Base

  has_many :tasks
  before_save :extract_dimentions

  # titleが空だとエラー
  # validates :title, presence: true
  #
  # 上と一緒。親クラスのvalidatesメソッドをクラス内でコールしている。
  # presence:は名前付き引数。
  # validates(:title, presence: true)

  # paperclipを使って画像アップロードを作ってみる
  # has_attached_file :avatar,
    # styles: { medium: "300x300>", thumb: "100x100>" },
    # default_url: "/images/:style/missing.png"

  # aws s3
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


  def image?
    avatar_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end

  def extract_dimentions
    return unless image?
    tempfile = avatar.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.image_width = geometry.width.to_i
      self.image_height = geometry.height.to_i
    end
  end
end
