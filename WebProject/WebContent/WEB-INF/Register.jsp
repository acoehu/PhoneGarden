<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
      <title>Please create an account:</title>
   </head>
   <body>
      Please fill out information below:
      <br><br>
      <form action="InsertRecord.jsp" onsubmit="return validateForm()" method="post"  name="regF">
                Enter your username:<input type="text" name="username" onblur="checkExist()"/><span id="isE"></span><br><br>
                Enter your password:<input type="password" name="password"/><br><br>
                Enter your name: <input type = "text" name = "name"><br><br>
         		Enter your DOB(MM/DD/YY): <input type = "text" name = "DOB" /><br><br>
                <input type="submit" value="Register" /><br>
            </form>
      <script>
      function checkExist(){
          var xmlhttp = new XMLHttpRequest();
          var username = document.forms["regF"]["username"].value;
          var url = "exist.jsp?username=" + username;
          xmlhttp.onreadystatechange = function(){
              if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            	  
                  if(xmlhttp.responseText == "User already exists")
                      document.getElementById("isE").style.color = "red";
                  else
                      document.getElementById("isE").style.color = "green";
                  document.getElementById("isE").innerHTML = xmlhttp.responseText;
              }
              
          };
          try{
          xmlhttp.open("GET",url,true);
          xmlhttp.send();
      }catch(e){alert("unable to connect to server");
      }
      }
      
      </script>
      
   </body>
</html>