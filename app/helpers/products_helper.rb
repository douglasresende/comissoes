module ProductsHelper
  def belongs_to_user(product)
    user_signed_in? && produc.user == current_user
  end
end
