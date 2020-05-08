class AddLoanPeriodToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :loan_period, :integer
  end
end
