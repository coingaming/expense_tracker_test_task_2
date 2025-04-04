# ExpenseTracker

A simple expense tracker application using Phoenix LiveView. The application allows users to log in with a unique username, add expense entries, and see real-time updates.

---

## Requirements

- **Code Management and Setup**
    - All code should be shared via GitHub repository.
    - The solution should be built with Phoenix LiveView.
    - The solution should manage data in memory. **No database** should be used.
    - You are free to use any Elixir/Erlang library and any open-source CSS framework for the design.

- **User Authentication**
    - Users should be able to log in by entering a unique username.
    - No complex authentication is required; a simple unique username is sufficient.

- **Expense Management**
    - Users should be able to add new expenses with the following fields:
        - **Amount** (numeric, required)
        - **Date** (defaults to today’s date if not specified)
        - **Description** (optional)
    - Each user should only see their own expenses.
    - It should be possible to open the same user’s ledger in multiple tabs and see real-time updates across all tabs.

---

## How to run

If you have `docker compose`:

Just run `docker compose up` and you will have access to the app on port: [`localhost:4444`](http://localhost:4444).

OR

You can run your Phoenix server on your machine:

I used:
- `ELIXIR`: Set to `1.16.1`.
- `OTP`: Set to `26`.

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Main endpoints:

sign in: `localhost:4000/users/log_in`

sign up: `localhost:4000/users/register"`

dashboard: `localhost:4000/dashboard`

new expense: `localhost:4000/dashboard/new-expense`

## Solution Overview
Using a GenServer for managing user data and expense management in memory is a suitable choice for the following reasons:

- **Concurrent Data Management**: GenServers can handle state and perform operations concurrently, making them ideal for managing user-specific data in a real-time application.
- **Real-Time Updates**: Since Phoenix LiveView works with real-time WebSocket connections, a GenServer can notify connected processes (tabs) of any state changes, ensuring synchronization.
- **Isolation of Data:**: By structuring the state to associate expenses with specific users, we ensure data integrity and security—each user only accesses their own data.
- **In-Memory Speed**: As there's no database involved, a GenServer provides quick access to state stored in memory.
