<?php
    include('../config/path.php');
    include(CONFIG.'/db_config.php');
    include(LIB.'/db.php');

    session_start();
    $mysqli = new mysql($db['host'], $db['user'], $db['passwd'], $db['dbname']);
    $mysqli->query("SELECT create_machine('{$_SESSION['id']}')");
    header("Location:".HTML_ROOT.'?page=setting');
?>
