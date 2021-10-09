<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.88.1">
	<title>TIENDA LOS TIBURONES</title>

	<link rel="shortcut icon" href="Tiburon.png" />
	<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF"
	 crossorigin="anonymous">

	<!-- Bootstrap core CSS -->
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		body {
			background: url("water.jpg");
			background-size: cover;
			background-position: center;
		}
	</style>

	<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<main class="form-signin">
		<form>
			<img src="Tiburon.png" alt="" width="90" height="34" class="d-inline-block align-text-top">
      <h1 class="h3 mb-3 fw-normal">Ingrese sus datos</h1>

      <div class="form-floating">
       <input type="inputuser" class="form-control" id="floatingInput" placeholder="name@example.com">
       <label for="floatingInput">Correo</label>
      </div>
      <div class="form-floating">
        <input type="inputpass" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Contraseña</label>
      </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar sesión</button>
    <p class="mt-5 mb-3 text-muted">&copy; Grupo 6</p>
    </form>
    
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
  </main>
    
  </body>
</html>