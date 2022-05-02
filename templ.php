<?php
/*$host = "localhost"; $user="root"; $password="morris"; $db = "dacco";
	mysqli_connect($host,$user,$password, $db);*/
$mysqli = new mysqli("localhost", "root", "morris", "sacco") or die(mysqli_error($mysqli));
	
if (ISSET ($_POST['login']) && !empty ($_POST['username']) && !empty('password') && !empty(_POST['logger'])){
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
        echo " You Have Entered Incorrect Password";
        exit();
    } 
}


?>