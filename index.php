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
			
			<?php
				session_start();
				if (isset($_SESSION['message'])){
					echo $_SESSION['message'];
                    unset($_SESSION['message']);
				} else {
					echo "Enter Username and Password to continue";
				} //endif
				?>
			<form method=POST action=index.php class="login_form">
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
require_once 'index.php';
//session_start();
$usr = 0;
$msg = "<br><span class=login_error>You Have Entered Incorrect Username/Password</span>";

$mysqli = new mysqli("localhost", "root", "WaterSprayer", "sacco") or die(mysqli_error($mysqli));
if ($_SERVER["REQUEST_METHOD"] == "POST"){
	if (ISSET ($_POST['login']) && !empty ($_POST['username']) && !empty('password') && !empty($_POST['logger'])){
	//get them variables
	$uname = $_POST['username'];
	$passwd = $_POST['password'];
	$tbl = $_POST['logger'];
	
	//check who is logging in
	if($tbl == 1){
		$result = $mysqli -> query ("select * from teller where Teller_Fname='".$uname."'AND TellerPass='".$passwd."' limit 1");	
		$usr = 1;
		} elseif ($tbl == 2){
			$result = $mysqli -> query("select * from attendant where AttendantFname='".$uname."'AND AttendantPass='".$passwd."' limit 1");		
			$usr = 2;
		} elseif ($tbl == 3){
			$result = $mysqli -> query("select * from boss where UserName='".$uname."'AND Password='".$passwd."' limit 1");		
			$usr = 3;
		} else {		
		
	} //end of if
	echo mysqli_num_rows($result);
	
	if(mysqli_num_rows($result)==1){
        echo "You Have Successfully Logged in";
		switch ($usr) {
			case 1:
				header("location: teller/");
				break;
			case 2:
				header("location: attendant/");
				break;
			case 3:
				header("location: manager/");
				break;
			default:
				$msg = "<span class='login_error'>You Have Entered Incorrect credentials</span>";
		}//end switch
        exit();
    } else {
        $msg = "<span class='login_error'>You Have Entered Incorrect Credentials</span>";
		$_SESSION['message'] = $msg;
		header("location: index.php");
		exit();
    }//end of case if 
}//end very big if
	
}	//end of bigger if



?>