<?php    
    // load up your config file
    require_once("php/config.php");
     
    require_once(TEMPLATES_PATH . "/header.php");
?>
                Advising and Administration
            </div>
        </header>
        <?php require_once(TEMPLATES_PATH . "/nav.php"); ?>
        <div class="content">
            <div class="row">
                <div class="col3"><a id="advising" href="<?php echo $config[paths][views]."/advising.php" ?>">Advising</a></div>
                <div class="col3"><a id="job_search" href="<?php echo $config[paths][views]."/job_search.php" ?>">Job Search</a></div>
                <div class="col3"><a id="internship_search" href="<?php echo $config[paths][views]."/internship_search.php" ?>">Internship Search</a></div>
            </div>
            <div class="row">
                <div class="col3"><a id="administration" href="<?php echo $config[paths][views]."/administration.php" ?>">Administration</a></div>
                <div class="col3"><a id="history" href="<?php echo $config[paths][views]."/history.php" ?>">History</a></div>
                <div class="col3"><a id="import" href="<?php echo $config[paths][views]."/import.php" ?>">New Job / Internship</a></div>
            </div>
		</div>
        <?php require_once(TEMPLATES_PATH . "/footer.php"); ?>
    </div>
</body>
</html>
