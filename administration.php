<?php    
// load up your config file
require_once("../config.php");
 
require_once(TEMPLATES_PATH . "/header.php");
?>
                Administration
            </div>
        </header>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        <div class="content">
              <form name = "boxform" method="GET" onsubmit="required()">
     <textarea rows="10" cols="50" type="text" name="the-query" placeholder="Type your query" autocomplete="off"></textarea> 
     <div id = "buttondiv">
     <input type="submit" name="submit" value="Create new entry">
<?php

if (isset($_GET['submit']))
	{
	if (isset($_GET['the-query']))
		{
		$query = $_GET['the-query'];
		$conn = new mysqli($config[db][host], $config[db][username], $config[db][password], $config[db][dbname]);
		if ($conn->query($query) === TRUE)
			{
			echo "New record created successfully";
			}
		  else
			{
			echo "Could not insert into database. Check your query for syntax errors";
			}
		}
	}

?>

		</div>
        <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>