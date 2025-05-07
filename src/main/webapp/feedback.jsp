<%@include file="config.jsp" %>
<% 
    String name = request.getParameter("name");
    String msg = request.getParameter("msg");
    String email = request.getParameter("email");

    if(name!=null && msg!=null && email!=null){
        PreparedStatement ps = con.prepareStatement("insert into feedback(feedback_msg, user_name, emailid) values (?,?,?)");
        ps.setString(1, msg);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.executeUpdate();
    }

    Statement s = con.createStatement();
    ResultSet rs = s.executeQuery("select * from feedback");
%>

<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Feedback</title>
        <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <style>
.navbar-nav {
    width: 100%
}

@media(min-width:568px) {
    .end {
        margin-left: auto
    }
}

@media(max-width:768px) {
    #post {
        width: 100%
    }
}

#clicked {
    padding-top: 1px;
    padding-bottom: 1px;
    text-align: center;
    width: 100%;
    background-color: #ecb21f;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px
}

#profile {
    background-color: unset
}

#post {
    margin: 10px;
    padding: 6px;
    padding-top: 2px;
    padding-bottom: 2px;
    text-align: center;
    background-color: #ecb21f;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px;
    width: 50%
}

body {
    background-color: black
}

#nav-items li a,
#profile {
    text-decoration: none;
    color: rgb(224, 219, 219);
    background-color: black
}

.comments {
    margin-top: 5%;
    margin-left: 20px
}

.darker {
    border: 1px solid #ecb21f;
    background-color: black;
    float: right;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px
}

.comment {
    border: 1px solid rgba(16, 46, 46, 1);
    background-color: rgba(16, 46, 46, 0.973);
    float: left;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px
}

.comment h4,
.comment span,
.darker h4,
.darker span {
    display: inline
}

.comment p,
.comment span,
.darker p,
.darker span {
    color: rgb(184, 183, 183)
}

h1,
h4 {
    color: white;
    font-weight: bold
}

label {
    color: rgb(212, 208, 208)
}

#align-form {
    margin-top: 20px
}

.form-group p a {
    color: white
}

#checkbx {
    background-color: black
}

#darker img {
    margin-right: 15px;
    position: static
}

.form-group input,
.form-group textarea {
    background-color: black;
    border: 1px solid rgba(16, 46, 46, 1);
    border-radius: 12px
}

form {
    border: 1px solid rgba(16, 46, 46, 1);
    background-color: rgba(16, 46, 46, 0.973);
    border-radius: 5px;
    padding: 20px
}</style>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript'></script>
</head>

<body oncontextmenu='return false' class='snippet-body'>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-5 col-md-6 col-12 pb-4">
                <h1>Comments</h1>
<%
                while(rs.next()){
%>
                <div class="comment mt-4 text-justify float-left"> <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                    <h4><%=rs.getString("user_name")%></h4> <span>- <%=rs.getString("feedback_date")%></span> <br>
                    <p><%=rs.getString("feedback_msg")%></p>
                </div>
<%
                }
%>
            </div>
            <div class="col-lg-4 col-md-5 col-sm-4 offset-md-1 offset-sm-1 col-12 mt-4">
                <form id="algin-form" method="POST" action="feedback.jsp">
                    <div class="form-group">
                        <h4>Leave a comment</h4> <label for="message">Message</label> <textarea name="msg" id="" msg cols="30" rows="5" class="form-control" style="background-color: black;"></textarea>
                    </div>
                    <div class="form-group"> <label for="name">Name</label> <input type="text" name="name" id="fullname" class="form-control"> </div>
                    <div class="form-group"> <label for="email">Email</label> <input type="text" name="email" id="email" class="form-control"> </div>
                    <div class="form-group"> <button type="submit" id="post" class="btn">Post Comment</button> </div>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>