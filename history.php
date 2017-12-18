<?php    
// load up your config file
require_once("../config.php");
 
require_once(TEMPLATES_PATH . "/header.php");
?>
                Advising History
            </div>
        </header>
        <form align=center padding=100px width=70%>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        <form name = "boxform" method="GET" onsubmit="required()">
        First Name
        <input type="text" name="FirstName" placeholder="First Name"></br>
        Last Name
        <input type="text" name="LastName" placeholder="Last Name"></br>
        <div id = "buttondiv">
        <input type="submit" name="submit" value="Search">
		</form>
		
<?php
if(isset($_GET['submit'])){
	$FirstName=$_GET['FirstName'];
	$LastName=$_GET['LastName'];
    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

		$sql = "SELECT a.sessionID, a.sDate, a.reasonID, s.first_name, s.last_name, s.sID, a.notes FROM advising_session a JOIN staff z ON a.adviserID = z.staffID JOIN student s ON a.cID = s.cID WHERE s.first_name = '$FirstName' AND s.last_name = '$LastName'";

        if ($result = $conn->query($sql)) {
            
                                $fields_num = mysqli_num_fields($result);
                                
                                echo "<table border='0'><tr>";
                                //echo "<td></td>";
                                echo "<td></td>";
                                mysqli_fetch_field($result); // skip one field
                                for($i=1; $i<$fields_num; $i++) {
                                    $field = mysqli_fetch_field($result);
                                    echo "<td>{$field->name}</td>";
                                }
                                echo "</tr>\n";

                                while($row = mysqli_fetch_row($result))
                                {
                                    $cID = $row[0];
                                    echo "<tr>";
                                    //echo "<td><a href=\"".$config[paths][views]."/delete.php?type=advising&id=$cID\">Edit</td>";
                                    echo "<td><button method=\"GET\" type=\"delete\" name=\"delete_advising\" value=\"$row[0]\">Delete</td>";
                                     // skip one field
                                    for($i=1; $i<$fields_num; $i++) {
                                         echo "<td>$row[$i]</td>";;
                                    }

                                    echo "</tr>\n";
                                }
                                /* free result set */
                                $result->close();
                        
                                echo "</table>";
                            }
                
                $conn->close();

	$conn->close();
}

if(isset($_GET['delete_advising'])){
    $id=$_GET['delete_advising'];

    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

        $sql = "DELETE FROM advising_session WHERE advising_session.sessionID = $id";

        if ($conn->query($sql)) {
            echo "Deleted.";
        } else {
            echo "Error Deleting.";
        }

    
    $conn->close();
    
}

?>

        <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>