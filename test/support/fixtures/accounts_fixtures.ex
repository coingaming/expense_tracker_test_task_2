defmodule ExpenseTracker.AccountsFixtures do
  @moduledoc """
  This module provides fixtures for the accounts context.
  """
  alias ExpenseTracker.Users

  def user_fixture(username \\ "tester") do
    {:ok, user} = Users.add_user(username)
    user
  end
end
