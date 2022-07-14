
function Download() {
  iex (New-Object Net.WebClient).DownloadString($url)
}
