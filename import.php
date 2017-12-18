<?php    
// load up your config file
require_once("../config.php");
 
require_once(TEMPLATES_PATH . "/header.php");
?>
                New Job / Internship
            </div>
        </header>
        <form align=center padding=100px width=70%>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        <input type="radio" name="type" value="job" checked/> Job
        <input type="radio" name="type" value="internship"  /> Internship</br>
        Organization Name
        <input type="text" name="Organization" placeholder="Organization"></br>
        Industry
        <input type="text" name="Industry" placeholder="Industry"></br>
        Quarter
        <select name="Quarter">
 			<option value="1">Fall</option>
  			<option value="2">Winter</option>
            <option value="3">Spring</option>
            <option value="4">Summer</option>
		</select></br>
        Bellevue College Lead
        <select name="Lead">
 			<option value="1">Kaytlyn Jones</option>
  			<option value="2">Dr. Who</option>
  			<option value="3">Patrick Steward</option>
		</select></br>
        Notes</br>
		<textarea rows="10" cols="50" type="text" name="Notes" placeholder="Notes" autocomplete="off"></textarea></br>
        <input type="submit" name="submit" value="Insert">
		</form>
		
<?php

if(isset($_GET['submit'])){
    $Type=$_GET['Type'];
    $Organization=$_GET['Organization'];
    $Industry=$_GET['Industry'];
    $Quarter=$_GET['Quarter'];
    $Lead=$_GET['Lead'];
    $Notes=$_GET['Notes'];
	$Date = getdate();
    $Date = "$Date[year]-$Date[mon]-$Date[mday]";


    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }
    if($Type == "internship") {

        $sql = "INSERT INTO internship(iID, date_posted, qID, notes) VALUES (null, '$Date', '$Quarter', '$Notes')";

        if ($conn->query($sql) === TRUE) {
            $sql2 = "SELECT max(iID) FROM internship LIMIT 1";
            $iID = mysqli_fetch_row($conn->query($sql2))[0];

            $sql3 = "INSERT IGNORE INTO organization(oID, oName, industry) VALUES (null, '$Organization', '$Industry')";
            if ($conn->query($sql3) === TRUE) {
                $sql4 = "SELECT min(oID) FROM organization WHERE oName = '$Organization' LIMIT 1";
                $oID = mysqli_fetch_row($conn->query($sql4))[0];
                $sql5 = "INSERT INTO internships(iID, bc_lead, oID) values ( '$iID', '$Lead', $oID)";

                if ($conn->query($sql5) === TRUE) {
                    echo "Success";
                } else {
                    echo "Oops! Something went wrong...";
                }   
            } else {
                echo "Oops! Something went wrong...";
            }                      
        } else {
            echo "Oops! Something went wrong...";
        }  
    } else {
        $sql = "INSERT INTO job_posting(jID, date_posted, qID, notes) VALUES (null, '$Date', '$Quarter', '$Notes')";
        
                if ($conn->query($sql) === TRUE) {
                    $sql2 = "SELECT max(jID) FROM job_posting LIMIT 1";
                    $jID = mysqli_fetch_row($conn->query($sql2))[0];
        
                    $sql3 = "INSERT IGNORE INTO organization(oID, oName, industry) VALUES (null, '$Organization', '$Industry')";
                    if ($conn->query($sql3) === TRUE) {
                        $sql4 = "SELECT min(oID) FROM organization WHERE oName = '$Organization' LIMIT 1";

                        $oID = mysqli_fetch_row($conn->query($sql4))[0];
                        $sql5 = "INSERT INTO job_postings(jID, bc_lead, oID) values ( '$jID', '$Lead', $oID)";

                        if ($conn->query($sql5) === TRUE) {
                            echo "Success";
                        } else {
                            echo "Oops! Something went wrong...";
                        }   
                    } else {
                        echo "Oops! Something went wrong...";
                    }                      
                } else {
                    echo "Oops! Something went wrong...";
                }  
        

    } 
	$conn->close();
}

?>

        <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>