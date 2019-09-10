class SecretCodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @secret_codes = SecretCode.includes(:user).order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @secret_code = SecretCode.new
  end

  def create
    (1.."#{params[:secret_code][:code]}".to_i).each do |i|
  		code = SecureRandom.hex(3)
  		SecretCode.create(code: code)
  	end
    flash[:success]= 'Secret code was successfully created.'
    redirect_to root_path
  end
end
