# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview
    def verification_email
        AccountMailer.verification_email(User)
    end   
end
