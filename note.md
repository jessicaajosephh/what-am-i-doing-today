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