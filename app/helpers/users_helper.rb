module UsersHelper
  def gravatar_for(user, size:100)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "//www.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
end
