Speed Stats
===========

Problem:

  We want to make improvements to a website. We want it fast.
How do we know each change we make improves or degrades the
speed of a list of urls to crawl?

  We record some damn metrics foo!

Program flow:

(from the website git root)

$ ss_compare <commit_hash> <commit_hash> ... |
              ss_graph

  * This will open a web browser with html graphs

Breakdown of commands:

$ ss_compare -h

Usage (from a git project): ss_compare [<commit_hash>,..]

  * This will checkout that git commit into a tmp
      directory, then will boot the app via config,
      then curl over a list of urls and collect
      response speed data into a file based db.

$ ss_graph

Usage: pipe ss_compare into this to turn response
  speed data into graph form



