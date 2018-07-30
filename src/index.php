<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hallo Welt</title>
</head>
<body>
  <h1>Hallo Welt!</h1>
  <!-- <?php phpinfo(); ?> -->
  <?php
    $dbhost = 'localhost:3306';
    $dbuser = 'root';
    $dbpass = 'root';
    $conn = mysqli_connect($dbhost, $dbuser, $dbpass);

    if (! $conn) {
      phpinfo();
      die('Could not connect: ' . mysqli_error());
    } else {
      echo '<p>' . 'PHP-Version: ' . phpversion() . '</p>' . PHP_EOL;
      echo '<p>Connected successfully</p>';
      
      mysqli_select_db($conn, 'test');
      $query = 'SELECT * FROM posts';
      $result = mysqli_query($conn, $query);
      mysqli_close($conn);
    }
  ?>
  
  <?php if(mysqli_num_rows($result) > 0): ?>
    <ul>
      <?php while($row = mysqli_fetch_object($result)): ?>
        <li><?php echo $row->text; ?></li>
      <?php endwhile; ?>
    </ul>
  <?php else: ?>
    <p>No Posts</p>
  <?php endif ?>

</body>
</html>