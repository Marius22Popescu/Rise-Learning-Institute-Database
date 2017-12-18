<?php
require_once("../config.php");

if(isset($_GET['submit'])){
    $query=strtolower(trim($_GET['query']));
    $filter=$_GET['filter'];
    $type=$_GET[submit];

    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

        switch ($type) {
            case "job_posting":
                $id = "jID";
                $p = "job_posting";
                $s = "job_postings";
                break;
            case "internship":
                $id = "iID";
                $p = "internship";
                $s = "internships";
                break;
        }



        switch ($filter) {
            case "description":
                $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE $p.notes LIKE '%$query%'";

                break;
            case "quarter":
                switch ($query) {
                    case "fall":
                    case "autumn":
                        $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE qID = 1";
                        break;
                    case "winter":
                        $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE qID = 2";
                        break;
                    case "spring":
                        $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE qID = 3";
                        break;
                    case "summer":
                        $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE qID = 4";
                        break;
                }
                break;
            case "organization":
                $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE organization.oName LIKE '%$query%'";
                break;
            case "industry":
                $sql = "SELECT $p.$id, $p.notes, $p.date_posted, $p.qID, organization.oName, organization.industry FROM $p RIGHT JOIN $s ON $s.$id = $p.$id JOIN organization ON organization.oID = $s.oID WHERE organization.industry LIKE '%$query%'";

                break;
        }

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
                    

                        while($row = mysqli_fetch_row($result)) {
                            $cID = $row[0];
                            echo "<tr>";
                            //echo "<td><a href=\"".$config[paths][views]."/delete.php?type=$p&id=$cID\">Edit</td>";
                            echo "<td><button method=\"GET\" type=\"delete\" name=\"delete_$p\" value=\"$row[0]\">Delete</button></td>";
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
}

if(isset($_GET['delete_internship'])){
    $id=$_GET['delete_internship'];
    
    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

        $sql = "DELETE FROM internship WHERE internship.iID = $id";
        $sql2 = "DELETE FROM internships WHERE internships.iID = $id";

        if ($result = $conn->query($sql2) && $conn->query($sql)) {
            echo "Deleted.";
        } else {
            echo "Error Deleting.";
        }

    
    $conn->close();
    
}

if(isset($_GET['delete_job_posting'])){
    $id=$_GET['delete_job_posting'];
    
    // Create connection 
    $conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
    // Check connection 
    if ($conn->connect_error)
        {
        die("Connection failed: " . $conn->connect_error);
        }

        $sql = "DELETE FROM job_posting WHERE job_posting.jID = $id";
        $sql2 = "DELETE FROM job_postings WHERE job_postings.jID = $id";

        if ($result = $conn->query($sql2) && $conn->query($sql)) {
            echo "Deleted.";
        } else {
            echo "Error Deleting.";
        }

    
    $conn->close();

    
}

?>