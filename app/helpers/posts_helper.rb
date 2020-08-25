module PostsHelper

  def render_post_content(post)
    simple_format(post.content)
  end

  def post_user_name_exist(post)
    post.user.name != nil && post.user.name != ""
  end
  
end
