<?php
require_once('wp-load.php');

if (isset($_GET['post_id'])) {
    $post_id = $_GET['post_id'];
    w3tc_flush_post($post_id);
} else {
    w3tc_flush_all();
}
echo "Done";