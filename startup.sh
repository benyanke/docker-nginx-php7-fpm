#!/bin/bash

# This runs on container startup.
# Ensure it returns exit code 0, otherwise the container will not continue to startup.

# Here is an example command which dumps the current env to /tmp/env
env > /tmp/env


# Exiting
echo "Startup complete!"
exit 0;
