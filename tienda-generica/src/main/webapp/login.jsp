<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title> Form Login | user </title>
   <link rel="stylesheet" href="css/style.css">
    <link href="style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>

    <div class="login-box">
     <img class="avatar"    src="https://cdn.pixabay.com/photo/2020/10/09/06/37/mario-kart-5639669_960_720.png">
    <h1>Ingresar</h1>
   <form >
   <label for="username">Usuario</label>
 <input type="text" placeholder="Enter Username" >

 <label for="password">Contraseña</i></label>
 <input type="password" placeholder="Enter password" >

<input type="submit" value="Log In">

<a href="">Perdi mi contraseña</a><br>
<a href="">Crear una cuenta</a>
   </form>
    </div>
    <script src="script.js">
    function comparar() {
		//trayendo texto de input de username
		var x = document.getElementById("inputuser").value;
		//trayendo texto de input de password
		var y = document.getElementById("inputpass").value;
		//url de la api 
		var baseurl = "http://localhost:8080/listarusuarios";
		//creando un objeto de manipulacion de solicitudes
		var xmlhttp = new XMLHttpRequest();
		//abriendo la api
		xmlhttp.open("GET", baseurl, true);
		//funcion interna que compara la información
		xmlhttp.onreadystatechange = function() {
			//si se obtiene un 200 (Conexion correcta)
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				//convirtiendo JSON en variable javascrip
				var usuarios = JSON.parse(xmlhttp.responseText);
				
				//verificando uno por uno si existe ese usuario
				for (i = 0; i < usuarios.length; i++) {
					
					//imprimiendo en la consola del navegador pata verificar
					console.log(usuarios);
					console.log(x);
					console.log(usuarios[i].usuario);
					console.log(y);
					console.log(usuarios[i].password);
					
					//si el nombre coincide
					if (usuarios[i].usuario === x) {
						//si la clave coincide
						if (usuarios[i].password === y) {
							console.log("si");
							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							document.getElementById("inputuser").value = "";
							document.getElementById("inputpass").value = "";
							window.location.href = "listausuarios.jsp";
							return;
						} else {
							//si la clave NO coincide
							console.log("error clave");
							var element = document.getElementById("error");
							element.classList.remove("visually-hidden");
							document.getElementById("inputuser").value = "";
							document.getElementById("inputpass").value = "";
							return;
						}
					}
				}
				//Si no existe el usuario
				console.log("no encontrado");
				
				//quitando la capacidad de ocultacion del error para mostrarlo
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				document.getElementById("inputuser").value = "";
				document.getElementById("inputpass").value = "";
				return;
			}
		};
		//ejecutando
		xmlhttp.send();
	}
    </script>
  </body>
</html>