<?php include("./index.php") 
function addFavorite($song_id, $user_id) {
  global $db;

  $stmt = $db->prepare('INSERT INTO favorites (song_id, user_id) VALUES (:song_id, :user_id)');
  $stmt->bindParam(':song_id', $song_id);
  $stmt->bindParam(':user_id', $user_id);

  if ($stmt->execute()) {
    return true;
  } else {
    return false;
  }
}
?>
<script>
    if (!authenticated) {
        loginPopup();
        window.history.pushState("", "", pageUrl + "/");
    } else
        showContent("favourites");
</script>
