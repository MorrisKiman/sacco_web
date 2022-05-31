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
					<a href="addTeller.php">Add Teller</a><br>
					<a href="addAttendant.php">Add New Attendant</a><br>
					<a href="accountReports.php">Accounts Reports</a><br>
					<a href="loanReports.php">Loans Reports</a><br>
					<a href="viewAttendant.php">View Attendants</a><br>
					<a href="myAccount.php">My Account</a><br>
					<a href="messages.php">Messages</a><br>
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
			<?php
				$mysqli = new mysqli("localhost", "root", "WaterSprayer", "sacco") or die(mysqli_error($mysqli));
				$result = $mysqli -> query("SELECT * FROM teller") or die($mysqli->error);
			?>
			<?php
                    $row = $result -> fetch_assoc();
					if ($row == null){
						echo "<h1>NO DATA FOUND!</h1>";
					}
					while ($row = $result -> fetch_assoc()):
				?>
                   <div class="ino_card">
						<h3>Teller <?php echo $row['TellerID']; ?></h3><hr>
						<span class="data_label">ID/Passport: </span><span class="data_label2"><?php echo $row['TellerIDNo']; ?></span><br><br>
						<span class="data_label">First Name: </span><span class="data_label2"><?php echo $row['Teller_Fname']; ?></span><br><br>
						<span class="data_label">Other Names: </span><br><span class="data_label2"><?php echo $row['Teller_Sname']; ?></span><br><br>
						<span class="data_label">Contacts: </span><span class="data_label2"><?php echo $row['Contacts']; ?></span><br>
					</div>
            <?php endwhile; ?> 
		</div>	
	
	</body>
</html>

					





















