class ReturnGameNotifierJob < ApplicationJob
  queue_as :default

  def perform(*loan)
    if loan[0].ended_at.nil?
      UserMailer.with(loan: loan[0]).return_game_email.deliver_now
    end
  end
end
