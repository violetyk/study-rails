Paperclip::Attachment.default_options.update({
  :path => ":rails_root/public/system/:attachment/:hash/:id.:extension",
  :hash_secret => "SOME_RANDOM_SECRET"
})
