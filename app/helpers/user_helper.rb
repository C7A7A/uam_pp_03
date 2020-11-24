module UserHelper
  def form_url(method, user)
    if method == 'register'
      form_with(url: 'register', model: user, local: true) { |f| yield f }
    else
      form_with(model: user, local: true) { |f| yield f }
    end
  end
end
