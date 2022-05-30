<html>
	<head>
		<title>LOCA: Manager</title>
		<link rel="stylesheet" href="../assets/css/main.css">
		<link rel="stylesheet" href="../assets/css/specific.css">
		<script src="../assets/JavaScript/general.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	
	<body>
		<header>
			<div class="header_div">
				<span class="page_title">
					<img src="../assets/images/loca_logo.png" width="42" height="42" class="openbtn" onclick="openNav()">
					LOCA<br>
						<span >
				<div class = "side_nav_bar" id="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
					<a href="index.php">Home</a><br>
					<a href="addTeller.php">Add New Teller</a><br>
					<a href="#">Accounts Reports</a><br>
					<a href="#">Loans Reports</a><br>
					<a href="#">Remove Teller</a><br>
					<a href="#">Remove Attendant</a><br>
					<a href="#">My Account</a><br>
					<a href="#">Messages</a><br>
				</div>
				<!-- <div id="main">
					<button class="openbtn" onclick="openNav()">=</button>  
				</div>	-->
			</span>
				</span>
				
				<span class="page_proile">
					Morris Kimani<br>
					<img src="../assets/images/loca_msg.png" width="42" height="28">
					<a href="../"><img src="../assets/images/logout.png" width="60" height="40"></a>
				</span><br>
			</div>
		</header>
		
		<div class = "sideNav">
			
		</div>
		
		<div class="body_content">
		
				<div class="data_card">
					<form method="POST" action="addAttendant.php" class="data_entry">	
						<h2>Add New Attendant</h2>
						<?php
							session_start();
							
							if (isset ($_SESSION['message'])){
								//print the message
								echo $_SESSION['message'];
								unset($_SESSION['message']);
							} else {
								
							}//end if
						?>
						Teller's ID/Passport Number<br>
						<input class="login_input" type=text placeholder="ID/Passport Number" name="AtIDNo" required maxlength=10><br><br>
						
						Teller's First Name<br>
						<input class="login_input" type=text placeholder="Teller First Name" name="AtFName" required ><br><br>
						
						Teller's Other Names<br>
						<input class="login_input" type=text placeholder="Teller Other Names" name="AtONames" required ><br><br>
						
						Teller's Tel. No.
						<input class="login_input" type=text placeholder="Tel. No." name="AtPhoneNo" required maxlength=13><br><br>
						<button class="login_input" type=submit name="login">Save</button>
					</form>
				</div>			
		</div>	
	
	</body>
</html>

<?php
	$mysqli = new mysqli("localhost", "root", "WaterSprayer", "sacco") or die(mysqli_error($mysqli));
	
	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		//get data
		//$id = 130126;
		$idNo = $_POST['AtIDNo'];
		$fName = $_POST['AtFName'];
		$oNames = $_POST['AtONames'];
		$telNo = $_POST['AtPhoneNo'];
		
		//insert the record
		
		$mysqli -> query("INSERT INTO attendant(AttendantIDNo,AttendantFname,AttendantLname,Contacts) values('$idNo','$fName','$oNames','$telNo')") or
					die($mysqli -> error);
		//send cool message
		$_SESSION['message'] ="<span class='login_error'>Attendant " . $fName . " added successfully</span><br>";
		header("location: addAttendant.php");
		
		
	}//END VERY BIG IF


?>























