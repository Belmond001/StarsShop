class AccountMailer < ApplicationMailer
    default from: 'home@StarsEvolution.com'
    def verification_email(user)
       @user=user
       mail(to: @user.email,subject: 'Welcome to Stars Evolution.com')
    end 
    def reminder_verification_email(user)
      @user = user
      @link = verify_account_url(user.id, user.verification_token, host: 'http://localhost', port: 3000)
      mail(to: user.email, subject: 'Email Verification Reminder')
    end 
end

__END__
  def welcome_email
    @user=params[:user]
    @url='http://example.com/login'
    mail(to: @user.email,subject:'welcome to my Awesome')
  end  