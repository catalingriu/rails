class ReturnGameNotifierJob < ApplicationJob
  queue_as :default

  def perform(loan)
    if loan.ended_at.nil?
      UserMailer.with(loan: loan).return_game_email.deliver_now
    end
  end
end
