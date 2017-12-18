<?php    
// load up your config file
require_once("../config.php");
 
require_once(TEMPLATES_PATH . "/header.php");
?>
                Internship Search
            </div>
        </header>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        <div class="content">
    <form name = "boxform" method="GET" onsubmit="required()">
    <input type="text" name="query" placeholder="Find a job!" autocomplete="off">
    Filter by: 

    <input type="radio" name="filter" value="description" checked/> Description
    <input type="radio" name="filter" value="quarter"  /> Quarter
    <input type="radio" name="filter" value="organization"  /> Organization
    <input type="radio" name="filter" value="industry"  /> Industry

    <div id = "buttondiv">
    <button type="submit" name="submit" value="internship">Search</button>
    <!-- *Input Industry, Input Organization, Search Results -->
    <?php require_once(TEMPLATES_PATH . "/search.php"); ?>
	</div>
    <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>
