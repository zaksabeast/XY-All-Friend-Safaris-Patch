# XY All Friend Safaris Patch

This patch allows Pokemon XY v1.5 to access any friend safari Pokemon. It makes the game think the console has 71 friends that have every available friend safari with all three slots unlocked.

This does not modify your actual 3ds friends list, it just makes the game think fake friends are available. You should probably avoid going online when using this patch - I'm not responsible for anything that goes wrong when using it.

## Usage

Console:

1. Download `code.ips` from the releases page
2. Enable luma game patches
3. Copy `code.ips` to your 3ds sd at `/luma/titles/0004000000055D00/code.ips` for X and `/luma/titles/0004000000055E00/code.ips` for Y

Citra:

1. Download `code.ips` from the releases page
2. Right click on the game and select "Open Mods Location"
3. Copy `code.ips` into the directory that appears

## Friend safari generation

There's a common misconception that friend safaris are calculated with the friend code used to add online 3ds friends. Friend safaris are actually calculated with a hidden local friend code. Check out `friend-safari-generator/index.js` to learn more.
