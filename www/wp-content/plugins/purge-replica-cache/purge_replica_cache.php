<?php
/*
 * Plugin Name: Purge Replica Cache
 */

function purge_replica_by_post_id($post_id) {
	$is_primary=getenv('IS_PRIMARY');
	if ($is_primary == 'TRUE'){
		echo "is primary";
		$url = getenv('REPLICA_URL')."?post_id=".strval($post_id);
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
			'Host: example.com',
		));
		curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		echo $result;
	}else{
		echo "not primary";
	}
}

function purge_replica_by_comment_id($comment_id, $comment_approved){
	if (!$comment_approved){
		return;
	}
	$comment = get_comment( $comment_id ); 
    $post_id = $comment->comment_post_ID;
	purge_replica_by_post_id($post_id);
}

add_action('save_post', 'purge_replica_by_post_id');
add_action('comment_post', 'purge_replica_by_comment_id', 10, 2 );