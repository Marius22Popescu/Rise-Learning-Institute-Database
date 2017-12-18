<?php    
// load up your config file
require_once("../config.php");
 
require_once(TEMPLATES_PATH . "/header.php");
?>
                Advising
            </div>
        </header>
        <form align=center padding=100px width=70%>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        First Name
        <input type="text" name="FirstName" placeholder="First Name"></br>
        Last Name
        <input type="text" name="LastName" placeholder="Last Name"></br>
        SID
        <input type="text" name="SID" placeholder="Student ID"></br>
        Home Phone
        <input type="text" name="HomePhone" placeholder="Home Phone"></br>
        Cell Phone
        <input type="text" name="CellPhone" placeholder="Cell Phone"></br>
        Email
		<input type="text" name="Email" placeholder="Email"></br>
		Reason
		<select name="Reason">
 			<option value="1">Career Planning</option>
  			<option value="2">Scholarships</option>
			<option value="3">Job-Search Assistance</option>
			<option value="4">Internships</option>
			<option value="5">Community Resources</option>
			<option value="6">Work-Study</option>
		</select></br>
        Notes</br>
		<textarea rows="10" cols="50" type="text" name="Notes" placeholder="Notes" autocomplete="off"></textarea></br>
		Advisor
		<select name="Advisor">
 			<option value="1">Kaytlyn Jones</option>
  			<option value="2">Dr. Who</option>
  			<option value="3">Patrick Steward</option>
		</select>
        <input type="submit" name="submit" value="Insert">
		</form>
		
<?php
if(isset($_GET['submit'])){
	$FirstName=$_GET['FirstName'];
	$LastName=$_GET['FirstName'];
	$SID=$_GET['SID'];
	$HomePhone=$_GET['HomePhone'];
	$CellPhone=$_GET['CellPhone'];
	$Email=$_GET['Email'];
	$Reason=$_GET['Reason'];
	$Notes=$_GET['Notes'];
	$Advisor=$_GET['Advisor'];
	$Date = getdate();
	$Date = "$Date[year]-$Date[mon]-$Date[mday]";
    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

		$sql = "INSERT INTO student(sID, first_name, last_name, home_phone, cell_phone, email) values ($SID, '$FirstName', '$LastName', $HomePhone, $CellPhone, '$Email')";
		$result = $conn->query($sql);
		$sql2 = "SELECT cID FROM student WHERE first_name = '$FirstName' AND last_name = '$LastName' LIMIT 1";
		$cID = mysqli_fetch_row($conn->query($sql2))[0];
		$sql3 = "INSERT INTO advising_session(cID, sDate, reasonID, notes, adviserID) values ( '$cID', '$Date', $Reason, '$Notes', $Advisor)";
		$session = $conn->query($sql3);

		if ($conn->query($sql3) === TRUE)
			{
			echo "New record created successfully";
			}
		else
			{
			echo 'Could not insert into database. Please fill all fields correctly.';
			}

	$conn->close();
}
?>

        <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>