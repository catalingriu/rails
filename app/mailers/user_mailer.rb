class UserMailer < ApplicationMailer
    default from: 'gameapp.notavailabletryagain@gmail.com'

    def return_game_email
        @loan = params[:loan]
        mail(to: @loan.user.mail, subject: 'Return the game!')
    end

    def notify_auto_return_done
        @loan = params[:loan]
        mail(to: @loan.user.mail, subject: 'Loan period ended!')
    end
end
