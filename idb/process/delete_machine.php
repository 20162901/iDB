<?php
    include('../config/path.php');
    include(CONFIG.'/db_config.php');
    include(LIB.'/db.php');

    session_start();
    $mysqli = new Mysql($db['host'], $db['user'], $db['passwd'], $db['dbname']);
    $param = array('account_id'=>$_SESSION['id'], 'machine_id'=>$_GET['machine_id']);
    $mysqli->file_query(SQL.'/delete_machine.sql', $param);
    header("Location:".HTML_ROOT.'?page=setting');
?>