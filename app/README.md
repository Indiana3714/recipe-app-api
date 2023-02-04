Annoyingly he skipped creation of venvs mid-way and has instructions that uses docker containers in some videos, while 
other videos show him using a venv instead.

So open VSCode in the "/app" subfolder and have it manually load the environment from one level above...

That way I can stick to the code shown in the video rather than doing imports like `from app.app import calc`