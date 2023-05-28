<?php
// Clean data from query result
function reformData($queryResult)
{
    return ($queryResult["songID"]);
}

$favSongsQuery = "SELECT favourites.songID FROM favourites
                  WHERE favourites.uid = $uid";

$result = mysqli_query($conn, $favSongsQuery);
$queryResult = mysqli_fetch_all($result, MYSQLI_ASSOC);

$favSongs = array_map("reformData", $queryResult);

// Convert favSongs to JSON and store in LocalStorage
echo "<script>
    localStorage.setItem('favSongs', JSON.stringify(" . json_encode($favSongs) . "));
</script>";
?>
<?php include('./components/navbar.php'); ?>
<div class="fav">
    <h1>Favourites Songs</h1>
    <button>Play all</button>
    <div style="width: 100%;" class="tileContainer">
        <?php foreach ($favSongs as $index => $songID) : ?>
            <div class="song" data="<?php echo $formatSongs[$songID]['id']; ?>">
                <div class="info">
                    <h4><?php echo $index + 1; ?> </h4>
                    <img src="<?php echo $formatSongs[$songID]['img']; ?>">
                    <div class="detail">
                        <h4><?php echo $formatSongs[$songID]['title']; ?></h4>
                        <h5 data-singer="<?php echo $formatSongs[$songID]["singerID"]; ?>"><?php echo $formatSongs[$songID]['singerName']; ?></h5>
                    </div>
                </div>
                <div class="func">
                    <i class="fas fa-trash"></i>
                    <i class="fas fa-list-ul"></i>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<script>
    // Retrieve favSongs from LocalStorage
    let favSongs = JSON.parse(localStorage.getItem('favSongs')) || [];

    // Update favSongs array when user adds or removes a favorite song
    function updateFavSongs(songID) {
        if (favSongs.includes(songID)) {
            // Remove song from favorites
            favSongs = favSongs.filter(id => id !== songID);
        } else {
            // Add song to favorites
            favSongs.push(songID);
        }

        // Update LocalStorage
        localStorage.setItem('favSongs', JSON.stringify(favSongs));
    }

    // Initialize favorite songs
    let favSongIDs = favSongs;
</script>
