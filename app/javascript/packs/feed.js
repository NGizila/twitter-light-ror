function showFollowedFeed() {
    let followed_feed = document.getElementById("followed_feed");
    followed_feed.style.display = followed_feed.style.display === 'block' ? 'none' : 'block';
  } 
  
  function showYourFeed() {
    let own_feed = document.getElementById("own_feed");
    own_feed.style.display = own_feed.style.display === 'none' ? '' : 'none';
  } 

  console.log("hey, feed.js is alive and well");
