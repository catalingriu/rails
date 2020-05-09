class RetrieveGameAfterDeadlineJob < ApplicationJob
  queue_as :default

  def perform(loan)
    if loan.ended_at.nil?

      @game = loan.game;
      @game.quantity += 1;
      @game.save;
  
      loan.ended_at = Time.now;
      loan.save;

      UserMailer.with(loan: loan).notify_auto_return_done.deliver_later
    end
  end
end
