<?php
    include('../config/path.php');
    session_start();
    session_destroy();
    header("Location:".HTML_ROOT);
?>
