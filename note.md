<div class="navbar">
      <% if logged_in?%>
        <li class="nav-item">
        <a class="nav-link" href="/logout"> Logout </a>
        <li class="nav-item">
        <a class="nav-link" href='/'> Home </a>
        <li class="nav-item">
        <a class="nav-link" href='/tasks/new'> New Task </a>
        <li class="nav-item">
        <a class="nav-link" href="/tasks"> All Task's </a> 
      <% end %> 
    </div>

    <link rel="stylesheet" href="/stylesheets/main.css" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    <h1> Login Page </h1>

<form action='/users/login' method="POST">
  Username: <input type="text" name="username">
  Password: <input type="password" name="password">
  <input type="submit">
</form>

<% if not_logged_in %>
    <a class="nav-link" href="/users/signup">Signup</a>
    <a class="nav-link" href="/users/login">Login</a>
<% end %>

<a class="nav-link active" aria-current="page" href="/">Home<a>