# hackernews-combinator

This is a script that grabs the top story from https://news.ycombinator.com/ and puts it right in your linux terminal, every time you open a new terminal session.

### How it works

- Checkout the repo to your prefered directory
- Make sure your run `sudo apt install jq` if you do not have it.
- Run this command `sudo chmod +x [your-prefered-directory-path]/script/news-combinator.sh` so that it become executable.
- Open your `.bashrc` with an editor of your choice (Vim for example)
- Append this line to the end of the file on a separate line `[your-prefered-directory-path]/script/news-combinator.sh`
- Watch what happens afterwards everytime you open a new session on the terminal

![A new terminal session with hackernews-combinator](https://doubleh90-assets.s3.amazonaws.com/Screenshot+from+2020-12-09+14-15-00.png)
