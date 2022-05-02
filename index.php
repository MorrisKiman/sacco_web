
<html>
	<head>
		<link rel="stylesheet" href="assets/css/main.css">
		<link rel="stylesheet" href="assets/css/specific.css">
	</head>
	
	<body>
		<div>
			<img src="assets/images/loca_logo.png" width="420" height="420">
		</div>
		<div>
			<h1 class=login_h1>LOCA SACCO LOGIN</h1>
			<hr>
			Log in to continue 
			<?php
			$msg = '';
				echo $msg?>
			<form method=POST action=index.php>
				Enter Username<br>
				<input class="login_input" type=text placeholder="Username" name="username" required ><br><br>
				Select User<br>
				<select class="login_input" name="logger">
					<option value=1>Teller</option>
					<option value=2>Attendant</option>
					<option value=3>Manager</option>
				</select><br><br>
				Enter Password<br>
				<input class="login_input" type=password placeholder="Password" name="password" required ><br><br>
				<button class="login_input" type=submit name="login">Login</button>
			</form>
		</div>
	
	</body>
</html>

<?php
$msg = '';
/*$host = "localhost"; $user="root"; $password="morris"; $db = "dacco";
	mysqli_connect($host,$user,$password, $db);*/
$mysqli = new mysqli("localhost", "root", "morris", "sacco") or die(mysqli_error($mysqli));
	
if (ISSET ($_POST['login']) && !empty ($_POST['username']) && !empty('password') && !empty($_POST['logger'])){
	//get them variables
	$uname = $_POST['username'];
	$passwd = $_POST['password'];
	$tbl = $_POST['logger'];
	
	//check who is logging in
	if($tbl == 1){
		$result = $mysqli -> query ("select * from teller where Teller_Fname='".$uname."'AND TellerPass='".$passwd."' limit 1");	
		} elseif ($tbl == 2){
			$result = $mysqli -> query("select * from attendant where AttendantFname='".$uname."'AND AttendantPass='".$passwd."' limit 1");		
		} elseif ($tbl == 3){
			$result = $mysqli -> query("select * from boss where UserName='".$uname."'AND Password='".$passwd."' limit 1");		
		} else {		
		$msg = "server offline";
	} //end of if
	
	if(mysqli_num_rows($result)==1){
        echo " You Have Successfully Logged in";
        exit();
    }
    else{
        $msg = "<br><span class=login_error>You Have Entered Incorrect Username/Password</span>";        
        header("location: index.php");
		exit();
    } 
}


?>



