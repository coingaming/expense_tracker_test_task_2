defmodule ExpenseTrackerWeb.DashboardLive do
  use ExpenseTrackerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Dashboard</h1>
      <p>LiveView is working!</p>
    </div>
    """
  end
end
